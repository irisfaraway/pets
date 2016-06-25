# Created by running rails generate migration AddHungerToPets hunger:decimal
class AddHungerToPets < ActiveRecord::Migration
  def change
    add_column :pets, :hunger, :demical, default: '0'
  end
end
