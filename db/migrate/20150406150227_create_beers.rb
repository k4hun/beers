class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :style_id
      t.string :description
      t.integer :rating
      t.integer :brewery_id

      t.timestamps
    end
  end
end
