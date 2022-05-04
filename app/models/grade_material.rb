# frozen_string_literal: true

class GradeMaterial < ApplicationRecord
  mount_uploader :material, MaterialUploader
  has_rich_text :content

  belongs_to :user
  belongs_to :grade
  validates :title, :subject_name, presence: true

  after_save do
    GradeMaterialJob.perform_later(self)
  end

  after_update do
    GradeMaterialJob.perform_later(self)
  end
end
