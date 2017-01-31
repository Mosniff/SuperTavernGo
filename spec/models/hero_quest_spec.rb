# maximum chapters??? You can only attempt 4 chapters, etc.

require 'rails_helper'

describe HeroQuest do

  before do
    @user1 = User.create(email: "test1@test.com", password: "123456")
    @hero1 = Hero.create(user_id: @user1.id, hp: 100)
    @quest1 = Quest.create
    @quest2 = Quest.create
    @hero_quest1 = HeroQuest.create(hero_id: @hero1.id, quest_id: @quest1.id)
  end

  it "should only allow the Hero to initiate a chapter if the User is within range" do
    # The range will be 100ft

  end

  # Hero needs an 'available' boolean which gets set back to true only after results are viewed?

  it "should allow the User to view the chapter results after the Hero has been questing for 1 hour" do

  end

  it "should deal damage to the Hero based on the danger of the Quest when the chapter's results are viewed" do

  end

  it "should not allow the Hero to attempt more chapters than the Quest's maximum chapter limit" do

  end

  it "should complete when all requirements are met" do

  end

  it "should reward the Hero when the User claims the reward for the completed HeroQuest" do

  end

  describe "initiating a chapter" do

    it "should set the Hero to 'is_questing' and the HeroQuest to 'is_in_progress' once a chapter is initiated" do
      # HeroQuests progress through a series of 'chapters'
      expect(@hero1.is_questing).to be(false)
      expect(@hero_quest1.is_in_progress).to be(false)
      @hero_quest1.initiate_chapter
      @hero1.reload
      @hero_quest1.reload
      expect(@hero1.is_questing).to be(true)
      expect(@hero_quest1.is_in_progress).to be(true)
    end

  end
  
end