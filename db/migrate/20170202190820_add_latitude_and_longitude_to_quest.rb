class AddLatitudeAndLongitudeToQuest < ActiveRecord::Migration[5.0]
  def change
    add_column :quests, :latitude, :float
    add_column :quests, :longitude, :float
  end
end
