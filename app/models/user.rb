require_relative "shortened_url"

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
    foreign_key: :user_id,
    class_name: "ShortenedURL"

  has_many :visits,
    foreign_key: :user_id,
    class_name: "Visit"

  has_many :visited_urls,
    through: :visits,
    source: :url

  def long_url
    self.urls.first.long_url
  end

  def create_short_url(longurl)
    ShortenedURL.create!(short_url: ShortenedURL.random_code, long_url: longurl, user_id: self.id)
  end
end
