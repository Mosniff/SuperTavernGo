class HeroQuest < ApplicationRecord
  belongs_to :hero
  belongs_to :quest
end
