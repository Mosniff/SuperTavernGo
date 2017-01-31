class AddStrengthAndCunningAndMagicToHero < ActiveRecord::Migration[5.0]
  def change
    add_column :heroes, :strength, :integer
    add_column :heroes, :cunning, :integer
    add_column :heroes, :magic, :integer
  end
end
