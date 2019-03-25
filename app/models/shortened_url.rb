require "securerandom"
require_relative "user"

class ShortenedURL < ApplicationRecord
  def self.random_code
    shorturl = nil
    until !shorturl.nil? && !self.exists?(short_url: shorturl)
      shorturl = SecureRandom.base64(16)
    end
    shorturl
  end

  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true
  validate :no_spamming
  validate :non_premium_max

  belongs_to :submitter,
    foreign_key: :user_id,
    class_name: "User"

  has_many :tags,
    foreign_key: :url_id,
    class_name: "Tagging"

  has_many :visits,
    foreign_key: :url_id,
    class_name: "Visit"

  has_many :visitors,
    through: :visits,
    source: :user

  has_many :distinct_visitors,
    -> { distinct },
    through: :visits,
    source: :user

  has_many :tag_topics,
    through: :tags,
    source: :tag_topics

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.distinct_visitors.count
  end

  def num_recent_uniques
    visits.where({ updated_at: 10.minutes.ago..Time.now }).select(:user_id).distinct.count
  end

  def no_spamming
    if submitter.submitted_urls.where({ created_at: 1.minute.ago..Time.now }).count >= 5
      self.errors["long_url"] << "cannot add more than 5 URLs within a minute"
    end
  end

  def non_premium_max
    if submitter.premium == false && submitter.submitted_urls.count >= 5
      self.errors["long_url"] << "Non premium users are limited to 5 URLs"
    end
  end
end
