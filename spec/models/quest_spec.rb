require 'rails_helper'

describe Quest do

  before do
    @user1 = User.create(email: "test1@test.com", password: "123456")
    @hero1 = Hero.create(user_id: @user1.id, hp: 100,
      strength: 2, cunning: 2, magic: 2
    )
    @quest1 = Quest.create(maximum_chapters: 8, required_strength: 10, required_cunning: 10, required_magic: 10,
      danger: 20, gold_reward: 100, stories_reward: 100, experience_reward: 100, 
      latitude: 51.657762, longitude: -0.396906 
    )
    @quest2 = Quest.create(maximum_chapters: 8, required_strength: 10, required_cunning: 10, required_magic: 10,
      danger: 20, gold_reward: 100, stories_reward: 100, experience_reward: 100, 
      latitude: 51.654371, longitude: -0.394515
    )
  end

  it "should create a new HeroQuest for a given Hero when initiated" do
    expect(@hero1.hero_quests.count).to eq(0)
    @hero1.initiate_quest(@quest1, 51.657762, -0.396906)
    expect(@hero1.hero_quests.count).to eq(1)
  end

  it "should create the HeroQuest with values based off the original Quest" do
    @hero_quest1 = @hero1.initiate_quest(@quest1, 51.657762, -0.396906)
    expect(@hero_quest1.maximum_chapters).to eq(@quest1.maximum_chapters)
    expect(@hero_quest1.required_strength).to eq(@quest1.required_strength)
    expect(@hero_quest1.required_cunning).to eq(@quest1.required_cunning)
    expect(@hero_quest1.required_magic).to eq(@quest1.required_magic)
    expect(@hero_quest1.danger).to eq(@quest1.danger)
    expect(@hero_quest1.gold_reward).to eq(@quest1.gold_reward)
    expect(@hero_quest1.stories_reward).to eq(@quest1.stories_reward)
    expect(@hero_quest1.experience_reward).to eq(@quest1.experience_reward)
    # expect(@hero_quest1.quest_type).to eq(@quest1.quest_type)
    # expect(@hero_quest1.).to eq(@quest1.)
    # expect(@hero_quest1.).to eq(@quest1.)
    # expect(@hero_quest1.).to eq(@quest1.)
    # expect(@hero_quest1.).to eq(@quest1.)
    # more, danger, reward etc... %%%

  end

  it "should not be possible to create a second HeroQuest for the same Quest for a given Hero" do
    @hero1.initiate_quest(@quest1, 51.657762, -0.396906)
    expect(@hero1.hero_quests.count).to eq(1)
    @hero1.initiate_quest(@quest1, 51.657762, -0.396906)
    # expect error??? %%%
    expect(@hero1.hero_quests.count).to eq(1)
  end

  it "should only be possible to initiate a Quest if the User is within range" do
    @hero1.initiate_quest(@quest2, 51.657762, -0.396906)
    expect(@hero1.hero_quests.count).to eq(0)
    @hero1.initiate_quest(@quest1, 51.657762, -0.396906)
    expect(@hero1.hero_quests.count).to eq(1)
  end

  it "should only be possible to initiate a Quest if the Hero meets the minimum level requirement" do

  end

  it "should prevent a Hero from initiating a Quest that has been attempted in the past 48 hours" do

  end
  
end