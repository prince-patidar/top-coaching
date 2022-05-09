# frozen_string_literal: true

class Grade < ApplicationRecord
  has_many :user_grades, dependent: :destroy
  has_many :users, through: :user_grades
  has_one :course
  has_many :grade_materials

  validates :class_name, presence: true
end
