class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :password
      t.string :avatar

      t.timestamps
    end
  end
end
