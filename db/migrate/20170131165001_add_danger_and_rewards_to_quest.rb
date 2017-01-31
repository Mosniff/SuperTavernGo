class AddDangerAndRewardsToQuest < ActiveRecord::Migration[5.0]
  def change
    add_column :quests, :danger, :integer
    add_column :quests, :gold_reward, :integer
    add_column :quests, :experience_reward, :integer
    add_column :quests, :stories_reward, :integer
  end
end
