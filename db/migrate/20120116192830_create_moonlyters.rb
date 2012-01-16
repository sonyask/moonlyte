class CreateMoonlyters < ActiveRecord::Migration
  def change
    create_table :moonlyters do |t|
      t.text :description
      t.float :rating
      t.text :education
      t.text :experience

      t.timestamps
    end
  end
end
