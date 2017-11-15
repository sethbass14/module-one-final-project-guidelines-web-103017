class CreateShows < ActiveRecord::Migration[5.0]
  def change
    create_table :shows do |t|
      t.string :date
      t.integer :year_id
      t.integer :venue_id
    end
  end
end
