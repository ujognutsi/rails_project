class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :name
      t.text :description
      t.integer :rating
      t.integer :ratings_number

      t.timestamps
    end
  end
end
