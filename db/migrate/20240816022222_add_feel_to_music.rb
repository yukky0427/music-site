class AddFeelToMusic < ActiveRecord::Migration[6.1]
  def change
    add_column :musics, :feel, :string
  end
end
