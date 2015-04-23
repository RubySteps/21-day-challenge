FactoryGirl.define do
  factory :category do
    name "Technology"
  end
  
  factory :course do
    title "Course about something"
    city "Hamburg"
    
    category
  end
end