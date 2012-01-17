class AddAverageRatingToSpecialty < ActiveRecord::Migration
  def change
    add_column :specialties, :average_rating, :float
  end
end
