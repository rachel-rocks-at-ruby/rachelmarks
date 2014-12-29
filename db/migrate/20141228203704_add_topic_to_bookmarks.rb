class AddTopicToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :topic, :string
  end
end
