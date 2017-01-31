class Hero < ApplicationRecord
  belongs_to :user
  has_many :hero_quests

  def update_status
    self.check_hp
  end

  def check_hp
    if self.hp > 0
      self.is_fainted = false
    else
      self.is_fainted = true
    end
  end

  def take_damage(number)
    self.hp -= number
  end

  def initiate_quest(quest)
    if HeroQuest.find_by(hero_id: self.id, quest_id: quest.id).nil?
      HeroQuest.create(
        hero_id: self.id,
        quest_id: quest.id
      )
    else
      # error???
      # %%%
    end
  end

end
