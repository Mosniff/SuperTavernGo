class AddIsInProgressAndChapterStartedToHeroQuest < ActiveRecord::Migration[5.0]
  def change
    add_column :hero_quests, :is_in_progress, :boolean, default: false
    add_column :hero_quests, :chapter_started, :datetime
  end
end
