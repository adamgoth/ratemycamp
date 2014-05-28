class AddFieldsToCampsites < ActiveRecord::Migration
  def change
    add_column :campsites, :sitename, :string
    add_column :campsites, :sitenumber, :string
    add_column :campsites, :city, :string
    add_column :campsites, :state, :string
    add_column :campsites, :country, :string
    add_column :campsites, :website, :string
  end
end
