class CreateSpecialties < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
      t.text :description
      t.float :rate

      t.timestamps
    end
  end
end
