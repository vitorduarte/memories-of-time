class UpdateWeatherInPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :weather, :string
    add_column :posts, :weather_description, :string
    add_column :posts, :weather_icon, :string
    add_column :posts, :temp, :decimal
    add_column :posts, :temp_min, :decimal
    add_column :posts, :temp_max, :decimal
  end
end
