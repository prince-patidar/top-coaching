# frozen_string_literal: true

class GradeMaterialJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: false

  def perform(grade_material)
    # Do something later
    grade_material.grade.users.each do |user|
      next unless user.has_role? :student

      @user_detail = { student: user, teacher: grade_material.user, course_name: grade_material.course_name }
      MaterialMailer.with(user_detail: @user_detail).new_grade_material_email.deliver
    end
  end
end
