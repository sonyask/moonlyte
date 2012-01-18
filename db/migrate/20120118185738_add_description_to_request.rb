class AddDescriptionToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :description, :string
    add_column :requests, :title, :string
    add_column :requests, :user_id, :integer
  end
end
