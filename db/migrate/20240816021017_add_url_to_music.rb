class AddUrlToMusic < ActiveRecord::Migration[6.1]
  def change
    add_column :musics, :url, :text
  end
end
