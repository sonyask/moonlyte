class RenameSpecialtyIdToTaggableId < ActiveRecord::Migration
  def change
    rename_column :tags, :specialty_id, :taggable_id
  end
end
