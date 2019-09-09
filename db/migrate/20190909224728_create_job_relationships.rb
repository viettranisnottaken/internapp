class CreateJobRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :job_relationships do |t|
      t.integer :cv_id
      t.integer :job_id

      t.timestamps
    end
  end
end
