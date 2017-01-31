class AddDangerAndRewardsToHeroQuest < ActiveRecord::Migration[5.0]
  def change
    add_column :hero_quests, :danger, :integer
    add_column :hero_quests, :gold_reward, :integer
    add_column :hero_quests, :experience_reward, :integer
    add_column :hero_quests, :stories_reward, :integer
  end
end
