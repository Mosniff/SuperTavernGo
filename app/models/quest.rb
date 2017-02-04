class Quest < ApplicationRecord
  has_many :hero_quests

  reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode  # auto-fetch address

  before_create :generate_name

  private

  def generate_name
    verbs = ["Kill", "Bash", "Destroy", "Cleanse", "Rescue", "Sanctify", "Politely rebuke", "Wrestle", 
      "Intimidate", "Reason with", "Beat up", "Outsmart", "Pillage", "Broker peace with", "Frighten", "Cheer up"
    ]
    verb = verbs[rand((verbs.count - 1) + 1)]
    adjectives = ["horrid", "slimy", "belligerent", "unholy", "sanctimonious", "socially regressive",
      "feral", "rabid", "nasty", "misunderstood", "frenzied", "raving", "rampaging", "foul", "terrible",
      "obnoxious", "ignorant", "intellectually dishonest", "moronic", "lazy", "dusty", "sloppy", "crunchy"
    ]
    adjective = adjectives[rand((adjectives.count - 1) + 1)]
    nouns = ["rats", "elves", "orcs", "dragon", "ooze", "kobolds", "elemental", "goblins",
      "bandits", "wolves", "cultists", "spiders", "golem", "gnomes", "spirit", "ghosts", "tentacles",
      "lizardmen", "vampire", "zombies"
    ]
    noun = nouns[rand((nouns.count - 1) + 1)]
    locations = ["dungeon", "tower", "cave", "crypt", "labyrinth", "graveyard", "castle", "forest",
      "temple", "haunted forest"
    ]
    location = locations[rand((locations.count - 1) + 1)]
    self.name = "#{verb} the #{adjective} #{noun} in the #{location}"
  end

end
