# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    file "MyString"
    send_at "2013-10-31 16:23:56"
  end
end
