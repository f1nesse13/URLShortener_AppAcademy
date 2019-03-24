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

  belongs_to :submitter,
    foreign_key: :user_id,
    class_name: "User"

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

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.distinct_visitors.count
  end

  def num_recent_uniques
    visits.where({ updated_at: 10.minutes.ago..Time.now }).select(:user_id).distinct.count
  end
end
