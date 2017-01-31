class AddMaximumChaptersToQuest < ActiveRecord::Migration[5.0]
  def change
    add_column :quests, :maximum_chapters, :integer
  end
end
