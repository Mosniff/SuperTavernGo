class AddIsQuestingToHero < ActiveRecord::Migration[5.0]
  def change
    add_column :heroes, :is_questing, :boolean, default: false
  end
end
