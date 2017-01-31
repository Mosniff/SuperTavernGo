class CreateHeroes < ActiveRecord::Migration[5.0]
  def change
    create_table :heroes do |t|
      t.references :user, foreign_key: true
      t.integer :hp
      t.boolean :is_fainted, default: false

      t.timestamps
    end
  end
end
