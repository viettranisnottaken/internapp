class Job < ApplicationRecord
  has_many :job_relationships, class_name: "JobRelationship"
  has_many :cvs, through: :job_relationships
end
