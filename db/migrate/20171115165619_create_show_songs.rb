class CreateShowSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :show_songs do |t|
      t.integer :show_id
      t.integer :song_id
    end
  end
end
