require 'rails_helper'

describe Hero do

  before do
    @user1 = User.create(email: "test1@test.com", password: "123456")
    @hero1 = Hero.create(user_id: @user1.id, hp: 100,
      strength: 2, cunning: 2, magic: 2
    )
  end

  describe "fainting" do

    it "should faint when their HP hits 0" do
      expect(@hero1.is_fainted).to be(false)
      @hero1.take_damage(100)
      @hero1.update_status
      expect(@hero1.is_fainted).to be(true)
    end

    it "should fail all HeroQuests when fainting" do

    end

    it "should not be able initiate any new HeroQuests when fainted" do

    end

    it "should not be able initiate any new HeroQuest chapters when fainted" do

    end

  end

  it "should be able to level up when they hit the required XP" do
    # The required experience is their level * 10 + (level - 1) * 10

  end

  it "should award the Hero new abilities when they level up" do

  end

  it "should allow the User to spend the Hero's prestige to increase their stats" do

  end

  it "should not allow a hero to initiate a new Quest, chapter, or drinking while they are 'unavailable'" do

  end
  
end