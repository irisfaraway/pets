# Created by running rails g model user provider uid name token expires_at:datetime
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :token
      t.datetime :expires_at

      t.timestamps null: false
    end
  end
end
