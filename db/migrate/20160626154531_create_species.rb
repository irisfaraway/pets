# Created by running rails g model species name image_normal
class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :name
      t.string :image_normal

      t.timestamps null: false
    end
  end
end
