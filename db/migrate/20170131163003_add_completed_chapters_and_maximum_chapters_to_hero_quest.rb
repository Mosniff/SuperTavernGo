class AddCompletedChaptersAndMaximumChaptersToHeroQuest < ActiveRecord::Migration[5.0]
  def change
    add_column :hero_quests, :completed_chapters, :integer
    add_column :hero_quests, :maximum_chapters, :integer
  end
end
