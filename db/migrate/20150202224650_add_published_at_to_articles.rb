class AddPublishedAtToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :published_at, :timestamp
  end
end
