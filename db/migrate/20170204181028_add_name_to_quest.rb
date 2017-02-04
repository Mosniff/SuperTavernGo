class AddNameToQuest < ActiveRecord::Migration[5.0]
  def change
    add_column :quests, :name, :string
  end
end
