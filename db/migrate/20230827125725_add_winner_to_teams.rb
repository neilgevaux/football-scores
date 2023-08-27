class AddWinnerToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :winner, :boolean
  end
end
