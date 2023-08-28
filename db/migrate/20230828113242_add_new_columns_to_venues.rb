class AddNewColumnsToVenues < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :address, :string
    add_column :venues, :capacity, :integer
    add_column :venues, :surface, :string
    add_column :venues, :image, :string
  end
end
