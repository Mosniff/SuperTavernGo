class AddIsCompletedToHeroQuest < ActiveRecord::Migration[5.0]
  def change
    add_column :hero_quests, :is_completed, :boolean, default: false
  end
end
