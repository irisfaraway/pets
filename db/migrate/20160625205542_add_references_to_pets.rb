# Created by running rails generate migration AddReferencesToPets
class AddReferencesToPets < ActiveRecord::Migration
  def change
    add_reference :pets, :user, index: true, foreign_key: true
  end
end
