class AddRequirementsToQuest < ActiveRecord::Migration[5.0]
  def change
    add_column :quests, :required_strength, :integer
    add_column :quests, :required_cunning, :integer
    add_column :quests, :required_magic, :integer
  end
end
