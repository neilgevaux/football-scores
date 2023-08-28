class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|

      t.integer :team_id
      t.string :name
      t.string :address
      t.string :city
      t.integer :capacity
      t.string :surface
      t.string :image
      t.timestamps
    end
  end
end
