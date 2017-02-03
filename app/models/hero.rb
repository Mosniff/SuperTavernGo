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
    check_hp
    self.save
  end

  def initiate_quest(quest, user_lat, user_lng)
    if quest.distance_from([user_lat, user_lng]) < 0.0621371
      if HeroQuest.find_by(hero_id: self.id, quest_id: quest.id).nil?
        HeroQuest.create(
          hero_id: self.id,
          quest_id: quest.id,
          maximum_chapters: quest.maximum_chapters,
          completed_chapters: 0,
          required_strength: quest.required_strength,
          required_cunning: quest.required_cunning,
          required_magic: quest.required_magic,
          danger: quest.danger,
          gold_reward: quest.gold_reward,
          experience_reward: quest.experience_reward,
          stories_reward: quest.stories_reward
        )
      else
        # error already on quest???
        # %%%
      end
    else
      # error not in range?
      # %%%%
    end
  end

end
