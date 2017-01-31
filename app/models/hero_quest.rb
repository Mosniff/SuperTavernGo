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

  def see_chapter_results
    if self.chapter_started + 1.hour < Time.now
      # Calculate damage that hero takes, is randomly determined quest.danger +/- 50%
      half_danger = (self.quest.danger / 2).to_i 
      random_damage = rand(half_danger)
      damage = ((self.quest.danger - half_danger) + (random_damage * 2)).to_i
      self.hero.take_damage(damage)
      # Change quest 'required' values based on hero's stats
      self.required_strength -= self.hero.strength
      self.required_cunning -= self.hero.cunning
      self.required_magic -= self.hero.magic
      self.completed_chapters += 1
      self.save
      self.hero.save
    else
      # %%% raise error??
    end
  end
end
