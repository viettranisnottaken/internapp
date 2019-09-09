class RemoveJobIdFromCvs < ActiveRecord::Migration[5.2]
  def change
      remove_column :cvs, :job_id
  end
end
