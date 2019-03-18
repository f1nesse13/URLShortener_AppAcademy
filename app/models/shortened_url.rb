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
end
