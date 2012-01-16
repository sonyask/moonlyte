class AddMoonlyterIdToSpecialty < ActiveRecord::Migration
  def change
    add_column :specialties, :moonlyter_id, :integer
  end
end
