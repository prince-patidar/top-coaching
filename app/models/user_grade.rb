# frozen_string_literal: true

class UserGrade < ApplicationRecord
  belongs_to :user
  belongs_to :grade
end
