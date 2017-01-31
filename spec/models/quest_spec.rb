require 'rails_helper'

describe Quest do

  before do
    @user1 = User.create(email: "test1@test.com", password: "123456")
    @hero1 = Hero.create(user_id: @user1.id, hp: 100)
    @quest1 = Quest.create
    @quest2 = Quest.create
  end

  it "should create a new HeroQuest for a given Hero when initiated" do
    expect(@hero1.hero_quests.count).to eq(0)
    @hero1.initiate_quest(@quest1)
    expect(@hero1.hero_quests.count).to eq(1)
  end

  it "should create the HeroQuest with values based off the original Quest" do
    @hero_quest1 = @hero1.initiate_quest(@quest1)
    expect(@hero_quest1.maximum_chapters).to eq(@quest1.maximum_chapters)
    # more, danger, reward etc... %%%

  end

  it "should not be possible to create a second HeroQuest for the same Quest for a given Hero" do
    @hero1.initiate_quest(@quest1)
    expect(@hero1.hero_quests.count).to eq(1)
    @hero1.initiate_quest(@quest1)
    # expect error??? %%%
    expect(@hero1.hero_quests.count).to eq(1)
  end

  it "should only be possible to initiate a Quest if the User is within range" do
    # The range will be 100ft
    # How test???
    # %%%

  end

  it "should only be possible to initiate a Quest if the Hero meets the minimum level requirement" do

  end

  it "should prevent a Hero from initiating a Quest that has been attempted in the past 48 hours" do

  end
  
end