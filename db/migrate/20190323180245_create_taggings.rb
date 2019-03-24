class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.integer :url_id, null: false, index: true
      t.integer :tag_id, null: false, index: true
      t.timestamps
    end
  end
end
