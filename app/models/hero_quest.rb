class HeroQuest < ApplicationRecord
  belongs_to :hero
  belongs_to :quest

  # validator to prevent duplicates???
  # %%%
end
