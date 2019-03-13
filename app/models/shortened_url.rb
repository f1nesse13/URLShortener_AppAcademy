class ShortenedURL < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true

  belongs_to :user,
    foreign_key: :user_id
end
