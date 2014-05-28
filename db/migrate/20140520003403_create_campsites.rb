class CreateCampsites < ActiveRecord::Migration
  def change
    create_table :campsites do |t|

      t.timestamps
    end
  end
end
