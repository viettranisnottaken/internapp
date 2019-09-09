class Cv < ApplicationRecord
  has_one_attached :filename
  has_many :job_relationships, class_name: "JobRelationship"
  has_many :jobs, through: :job_relationships
  belongs_to :user

  validates :filename, presence: true, blob: {size_range: 0..10.megabytes}
  validate :correct_document_mime_type

  private

  def correct_document_mime_type
    if filename.attached? && !filename.content_type.in?("application/pdf")
      filename.purge
      errors.add(:filename, 'Must be a PDF file')
    end
  end

  # def file_validation
  #   if filename.attached?
  #     if filename.blob.byte_size > 1000000
  #       filename.purge
  #       errors[:base] << 'Too big'
  #     elsif !filename.blob.content_type.in?("application/pdf")
  #       filename.purge
  #       errors[:base] << 'Wrong format'
  #     end
  #   end
  # end
end
