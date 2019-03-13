class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :urls,
    foreign_key: :user_id,
    class_name: "ShortenedURL"

  def long_url
    self.urls.first.long_url
  end
end
