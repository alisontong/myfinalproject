class AddCityIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city_id, :string
    add_index :users, :city_id
  end
end
