class RemoveLongUrlIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :shortened_urls, :long_url
  end
end
