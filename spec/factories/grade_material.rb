FactoryBot.define do
  factory :grade_material do
    user
    grade
    course_name { 'Physics' }
    subject_name { 'Physics' }
  end
end