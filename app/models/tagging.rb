class Tagging < ApplicationRecord
  validates :url_id, presence: true
  validates :tag_id, presence: true

  belongs_to :url,
    foreign_key: :url_id,
    class_name: "ShortenedURL"
end
