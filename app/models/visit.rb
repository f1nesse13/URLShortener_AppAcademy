class Visit < ApplicationRecord
  validates :user_id, presence: true
  validates :url_id, presence: true
  def self.record_visit!(user, url)
    self.create!(user_id: user, url_id: url)
  end

  belongs_to :user,
    foreign_key: :user_id,
    class_name: "User"

  belongs_to :url,
    foreign_key: :url_id,
    class_name: "ShortenedURL"
end
