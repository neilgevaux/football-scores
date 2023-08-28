class DropFixturesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :fixtures
  end
end
