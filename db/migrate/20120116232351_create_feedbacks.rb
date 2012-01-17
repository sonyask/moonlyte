class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :comment
      t.integer :rating

      t.timestamps
    end
  end
end
