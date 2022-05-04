# frozen_string_literal: true

class GradeMaterialsController < ApplicationController
  before_action :set_grade_material, only: %i[edit update destroy show]
  load_and_authorize_resource

  def index
    @grade_materials = if current_user.teacher?
                         current_user.teacher_grades
                       else
                         current_user.student_grades
                       end
  end

  def show; end

  def new
    @grade_material = current_user.grade_materials.build
  end

  def create
    @grade_material = current_user.grade_materials.build(grade_material_params)
    return redirect_to grade_materials_path if @grade_material.save

    render :new, status: :unprocessable_entity
  end

  def edit; end

  def update
    return redirect_to grade_materials_path if @grade_material.update(grade_material_params)

    render :edit, status: :unprocessable_entity
  end

  def destroy
    @grade_material.destroy
    redirect_to grade_materials_path, status: :see_other
  end

  def download
    send_file "#{Rails.root}/public/#{params[:file_name]}"
  end

  private

  def grade_material_params
    params.require(:grade_material).permit(:title, :subject_name, :content, :grade_id)
  end

  def set_grade_material
    @grade_material = GradeMaterial.find(params[:id])
  end
end
