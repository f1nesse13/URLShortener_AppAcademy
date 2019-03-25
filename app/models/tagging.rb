class Tagging < ApplicationRecord
  validates :url_id, presence: true
  validates :tag_id, presence: true

  belongs_to :urls,
    foreign_key: :url_id,
    class_name: "ShortenedURL"

  belongs_to :tag_topics,
    foreign_key: :tag_id,
    class_name: "TagTopic"
end
