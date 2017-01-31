class HeroQuest < ApplicationRecord
  belongs_to :hero
  belongs_to :quest

  # validator to prevent duplicates???
  # %%%

  def initiate_chapter
    self.chapter_started = Time.now
    self.is_in_progress = true
    self.hero.is_questing = true
    self.hero.save
    self.save
  end
end
