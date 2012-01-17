class AddTotalRatingToSpecialty < ActiveRecord::Migration
  def change
    add_column :specialties, :total_rating, :integer
  end
end
