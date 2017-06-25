FactoryGirl.define do
  factory :group do
    name 'G1'
  end

  factory :invalid_group, class: Group do
    name ''
  end
end
