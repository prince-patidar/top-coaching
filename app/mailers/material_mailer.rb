# frozen_string_literal: true

class MaterialMailer < ApplicationMailer
  def new_grade_material_email
    @user_detail = params[:user_detail]
    mail(to: @user_detail[:student].email, subject: 'New Course Material is added.!!')
  end
end
