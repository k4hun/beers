class AddBeeridToComment < ActiveRecord::Migration
  def change
    add_column :comments, :beer_id, :integer
  end
end
