class AddCityIdToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :city_id, :integer
  end
end
