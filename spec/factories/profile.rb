FactoryBot.define do
	factory :profile do
    name { 'ABC' }
    father_name { 'XYZ' }
    age { 22 }
    dob { Time.now }
    user
	end
end