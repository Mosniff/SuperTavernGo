class AddGoldAndExperienceAndStoriesAndPrestigeToHero < ActiveRecord::Migration[5.0]
  def change
    add_column :heroes, :gold, :integer, default: 0
    add_column :heroes, :experience, :integer, default: 0
    add_column :heroes, :stories, :integer, default: 0
    add_column :heroes, :prestige, :integer, default: 0
  end
end
