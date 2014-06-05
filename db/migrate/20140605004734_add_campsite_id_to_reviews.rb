class AddCampsiteIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :campsite_id, :integer
  end
end
