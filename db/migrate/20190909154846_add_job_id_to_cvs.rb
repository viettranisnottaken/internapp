class AddJobIdToCvs < ActiveRecord::Migration[5.2]
  def change
    add_reference :cvs, :job, foreign_key: true
  end
end
