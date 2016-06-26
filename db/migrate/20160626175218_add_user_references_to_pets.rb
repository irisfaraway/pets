# Created by running rails generate migration AddReferencesToPets2
class AddUserReferencesToPets < ActiveRecord::Migration
  def change
    add_reference :pets, :species, index: true, foreign_key: true
  end
end
