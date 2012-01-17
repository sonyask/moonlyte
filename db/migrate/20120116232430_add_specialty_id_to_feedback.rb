class AddSpecialtyIdToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :specialty_id, :integer
  end
end
