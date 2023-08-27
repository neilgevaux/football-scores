class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.integer :id
      t.string :name
      t.string :city

      t.timestamps
    end
  end
end