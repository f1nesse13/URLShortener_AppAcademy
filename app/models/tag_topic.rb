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
    self.urls.joins("JOIN visits ON visits.url_id = shortened_urls.id").order("COUNT(visits.url_id) DESC").group("shortened_urls.id").limit(5)
  end
end
