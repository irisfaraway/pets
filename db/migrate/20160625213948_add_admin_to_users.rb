# Created by running rails generate migration AddAdminToUsers admin:boolean
class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
