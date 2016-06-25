# Created by running rails generate migration AddHungerToPets hunger:decimal but changed to float later
class AddHungerToPets < ActiveRecord::Migration
  def change
    add_column :pets, :hunger, :float, default: '0'
  end
end
