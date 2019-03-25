require_relative "shortened_url"
require_relative "visit"

class TagTopic < ApplicationRecord
  validates :topic, presence: true, uniqueness: true
  has_many :url_topics,
    foreign_key: :tag_id,
    class_name: "Tagging"
  has_many :urls,
    through: :url_topics,
    source: :urls

  def popular_links
  end
end
