# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GradeMaterials', type: :request do
  let!(:student) { create(:user, email: 'stud@mu.com') }
  let!(:teacher) { create(:user, email: 'teacher@mu.com') }
  let!(:grade) { create(:grade) }
  let!(:user_grade) { create(:user_grade, user: student, grade: grade) }
  let!(:grade_material) { create(:grade_material,user: student, grade: grade) }
  let!(:profile) { create(:profile, user: student) }
  let!(:course) { create(:course, grade: grade) }
  let(:valid_attributes) do
    { user_id: teacher.id, grade_id: grade.id, course_name: 'RD Sharama', subject_name: 'Maths' }
  end

  let(:invalid_attributes) do
    { user_id: teacher.id, grade_id: grade.id, subject: 'Maths' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      sign_in student
      get grade_materials_url
      expect(response).to be_successful
    end
  end
  describe 'GET /show' do
    it 'renders a successful response' do
      sign_in student
      get grade_material_path(grade_material)
      expect(response).to be_successful
    end
  end
  describe 'POST /create' do
    context 'with valid parameters' do

      it 'creates a new Grade material' do
        sign_in teacher
        expect do
          post grade_materials_url, params: { grade_material: valid_attributes }
        end.to change(GradeMaterial, :count).by(1)
      end

      it 'redirects to the grade_material' do
        sign_in teacher
        post grade_materials_url, params: { grade_material: valid_attributes }
        expect(response).to redirect_to(grade_materials_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new grade material' do
        sign_in teacher
        expect do
          post grade_materials_url, params: { grade_material: invalid_attributes }
        end.to change(GradeMaterial, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        sign_in teaccher
        post grade_materials_url, params: { grade_material: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end
  describe 'GET /edit' do
    it 'render a successful response' do
      sign_in teacher
      get edit_grade_material_url(grade_material)
      expect(response).to be_successful
    end
  end
end
