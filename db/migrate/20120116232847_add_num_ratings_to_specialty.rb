class AddNumRatingsToSpecialty < ActiveRecord::Migration
  def change
    add_column :specialties, :num_ratings, :integer
  end
end
