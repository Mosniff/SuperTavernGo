class CreateHeroQuests < ActiveRecord::Migration[5.0]
  def change
    create_table :hero_quests do |t|
      t.references :hero, foreign_key: true
      t.references :quest, foreign_key: true

      t.timestamps
    end
  end
end
