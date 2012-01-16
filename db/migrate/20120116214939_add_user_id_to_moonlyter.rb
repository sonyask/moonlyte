class AddUserIdToMoonlyter < ActiveRecord::Migration
  def change
    add_column :moonlyters, :user_id, :integer
  end
end
