class DropJobRelationships < ActiveRecord::Migration[5.2]
  def change
    drop_table :job_relationships
  end
end
