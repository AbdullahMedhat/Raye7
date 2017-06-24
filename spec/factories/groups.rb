FactoryGirl.define do
  factory :group do
    name 'test'
  end

  factory :group2 do
    name 'test'
  end

  factory :invalid_group, class: Group do
    name 'Axies'
  end

  # factory :todo_updated, class: Todo do
  #   description Faker::Lorem.paragraph
  #   done true
  # end
end
