class ChangeDatestringToDatetime < ActiveRecord::Migration[5.0]
  def change
    remove_column :shows, :date
    add_column :shows, :date, :date
  end
end
