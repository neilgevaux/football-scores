class CreateLeagues < ActiveRecord::Migration[7.0]
  def change
    create_table :leagues do |t|
      t.integer :id
      t.string :name
      t.string :country
      t.string :logo
      t.string :flag
      t.integer :season
      t.string :round

      t.timestamps
    end
  end
end
