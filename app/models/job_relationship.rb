class JobRelationship < ApplicationRecord
  belongs_to :cv
  belongs_to :job

  validates :cv_id, uniqueness: true
end
