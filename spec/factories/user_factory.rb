FactoryGirl.define do
  factory :user do
    name "Marko"
    email "os.chilim@gmail.com"
    password "adminadmin"

    factory :admin_user do
      admin true
    end
  end
end