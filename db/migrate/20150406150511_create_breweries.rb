class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.attachment :logo
      
      t.timestamps
    end
  end
end
