class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.integer :goal_id
      t.integer :fixture_id
      t.integer :home
      t.integer :away

      t.timestamps
    end
  end
end
