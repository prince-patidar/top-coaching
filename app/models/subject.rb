# frozen_string_literal: true

class Subject < ApplicationRecord
  belongs_to :user
  validates :subject_name, presence: true
end
