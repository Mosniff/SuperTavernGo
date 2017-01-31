class AddRequirementsToHeroQuest < ActiveRecord::Migration[5.0]
  def change
    add_column :hero_quests, :required_strength, :integer
    add_column :hero_quests, :required_cunning, :integer
    add_column :hero_quests, :required_magic, :integer
  end
end
