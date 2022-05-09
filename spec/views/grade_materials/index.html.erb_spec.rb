# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'grade_materials/index', type: :view do
  let!(:user) { create(:user, email: 'stud@ab.com') }
  let!(:grade) { create(:grade) }
  before(:each) do
    sign_in user
    assign(:grade_materials, [
             GradeMaterial.create!(
               course_name: 'Rails Testing',
               subject_name: 'Rails TT',
               grade_id: grade.id,
               user_id: user.id
             ),
             GradeMaterial.create!(
               course_name: 'Rails Patterns',
               subject_name: 'Rails PP',
               grade_id: grade.id,
               user_id: user.id
             )
           ])
  end

  it 'renders a list of grade_materials ' do
    render
    sign_in user
    expect(rendered).to include('Rails Testing')

    expect(rendered).to include('Rails Patterns')
  end
end
