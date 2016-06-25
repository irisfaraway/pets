# Created by running rails generate migration AddLastFedToPets last_fed:datetime
class AddLastFedToPets < ActiveRecord::Migration
  def change
    add_column :pets, :last_fed, :datetime
  end
end
