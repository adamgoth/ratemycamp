class RemoveSitenumberFromCampsites < ActiveRecord::Migration
  def change
  	remove_column :campsites, :sitenumber
  	rename_column :campsites, :city, :nearesttown
  	add_column :campsites, :region, :string
  	add_column :campsites, :longitude, :decimal, {:precision=>10, :scale=>6}
  	add_column :campsites, :latitude, :decimal, {:precision=>10, :scale=>6}
  	add_column :campsites, :phone, :string
  	add_column :campsites, :numberofsites, :integer
  	add_column :campsites, :distancefromnearesttown, :decimal, {:precision=>7, :scale=>3}
  end
end
