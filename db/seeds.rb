# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

# Quests - McDonalds

ActiveRecord::Base.connection.execute("DELETE FROM quests")

page = CSV.read("csvs/mcdonalds.csv")

column_names = page.shift
column_names.map!{|name| name.gsub(" ", "_").downcase}

page.each do |row|

  maximum_chapters = (rand(4) + 4) 
  required_strength = (rand(9) + 1) 
  required_cunning = (rand(9) + 1) 
  required_magic = (rand(5) + 1) 
  danger = (rand(40) + 10) 
  gold_reward = (rand(450) + 50) 
  experience_reward = (rand(450) + 50) 
  stories_reward = (rand(90) + 10) 
  lat = nil
  lng = nil

  column_names.each_with_index do |column_name, i|
    case column_name
    when "lat"
      lat = row[i].to_f
    when "lng"
      lng = row[i].to_f
    end
  end
  
  Quest.create(
    maximum_chapters: maximum_chapters,
    required_strength: required_strength,
    required_cunning: required_cunning,
    required_magic: required_magic,
    danger: danger,
    gold_reward: gold_reward,
    experience_reward: experience_reward,
    stories_reward: stories_reward,
    latitude: lat,
    longitude: lng
  )
end