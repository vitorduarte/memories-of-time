class AddRegionToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :country_code, :string
    add_column :posts, :country_name, :string
    add_column :posts, :region_code, :string
    add_column :posts, :region_name, :string
    add_column :posts, :latitude, :decimal
    add_column :posts, :longitude, :decimal
    remove_column :posts, :lat, :decimal
    remove_column :posts, :long, :decimal
  end
end
