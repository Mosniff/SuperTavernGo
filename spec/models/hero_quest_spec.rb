# maximum chapters??? You can only attempt 4 chapters, etc.

require 'rails_helper'

describe HeroQuest do

  before do
    @user1 = User.create(email: "test1@test.com", password: "123456")
    @hero1 = Hero.create(user_id: @user1.id, hp: 100,
      strength: 2, cunning: 2, magic: 2
    )
    @quest1 = Quest.create(maximum_chapters: 8, required_strength: 4, required_cunning: 4, required_magic: 4,
      danger: 20, gold_reward: 100, stories_reward: 100, experience_reward: 100
    )
    # @quest2 = Quest.create(maximum_chapters: 8, required_strength: 10, required_cunning: 10, required_magic: 10,
    #   danger: 20, gold_reward: 100, stories_reward: 100, experience_reward: 100
    # )
    @hero_quest1 = @hero1.initiate_quest(@quest1)
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

    it "should not allow the Hero to attempt more chapters than the Quest's maximum chapter limit" do

    end

    it "should only allow the Hero to initiate a chapter if the User is within range" do
    # The range will be 100ft

    end

  end

  describe "viewing the results of a chapter" do

    before do 
      Timecop.freeze(Time.now) do
        @hero_quest1.initiate_chapter
      end
    end

    it "should allow the User to view the chapter results after the Hero has been questing for 1 hour" do
      # only show "ready to see progress" logic in the view???
      Timecop.freeze(Time.now) do
        @hero_quest1.see_chapter_results
        # see error? 
        # %%%
        expect(@hero_quest1.completed_chapters).to eq(0)
      end
      Timecop.freeze(Time.now + 61.minutes) do
        @hero_quest1.see_chapter_results
        expect(@hero_quest1.completed_chapters).to eq(1)
      end
    end

    it "should deal damage to the Hero based on the danger of the Quest when the chapter's results are viewed" do
      Timecop.freeze(Time.now) do
        expect(@hero1.hp).to eq(100)
      end
      Timecop.freeze(Time.now + 61.minutes) do
        @hero_quest1.see_chapter_results
        @hero1.reload
        expect(@hero1.hp).to be < 100
      end
    end

    it "should update the 'required' values of the HeroQuest based on the Hero's stats" do
      Timecop.freeze(Time.now) do
        expect(@hero_quest1.required_strength).to eq(4)
        expect(@hero_quest1.required_cunning).to eq(4)
        expect(@hero_quest1.required_magic).to eq(4)
      end
      Timecop.freeze(Time.now + 61.minutes) do
        @hero_quest1.see_chapter_results
        @hero_quest1.reload
        expect(@hero_quest1.required_strength).to eq(4 - @hero1.strength)
        expect(@hero_quest1.required_cunning).to eq(4 - @hero1.cunning)
        expect(@hero_quest1.required_magic).to eq(4 - @hero1.magic)
      end
    end

    it "should make the hero available again after the chapter results have been viewed" do
      Timecop.freeze(Time.now) do
        @hero1.reload
        expect(@hero1.is_questing).to be(true)
      end
      Timecop.freeze(Time.now + 61.minutes) do
        @hero_quest1.see_chapter_results
        @hero1.reload
        expect(@hero1.is_questing).to be(false)
      end
    end

    it "should complete when all requirements are met" do
      Timecop.freeze(Time.now + 61.minutes) do
        @hero_quest1.see_chapter_results
        @hero1.reload
        @hero_quest1.initiate_chapter
      end
      Timecop.freeze(Time.now + 122.minutes) do
        @hero_quest1.see_chapter_results
        expect(@hero_quest1.is_completed).to be(true)
      end
    end

  end

  it "should reward the Hero when the User claims the reward for the completed HeroQuest" do
    Timecop.freeze(Time.now) do
      @hero_quest1.initiate_chapter
      expect(@hero1.gold).to eq(0)
      expect(@hero1.experience).to eq(0)
      expect(@hero1.stories).to eq(0)
    end
    Timecop.freeze(Time.now + 61.minutes) do
      @hero_quest1.see_chapter_results
      @hero1.reload
      @hero_quest1.initiate_chapter
    end
    Timecop.freeze(Time.now + 122.minutes) do
      @hero_quest1.see_chapter_results
      @hero_quest1.claim_reward
      @hero1.reload
      expect(@hero1.gold).to eq(0 + @hero_quest1.gold_reward)
      expect(@hero1.experience).to eq(0 + @hero_quest1.experience_reward)
      expect(@hero1.stories).to eq(0 + @hero_quest1.stories_reward)
    end
  end
  
end