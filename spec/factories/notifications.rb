FactoryBot.define do
  factory :notification do
    creator { "MyString" }
    title { "MyText" }
    message { "MyText" }
    notification_for_role { "MyString" }
    notificatin_for_grade { 1 }
    notificatin_for_user { 1 }
  end
end
