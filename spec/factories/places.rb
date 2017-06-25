FactoryGirl.define do
  factory :place do
    name 'Maadi'
    longitude '12.213.213'
    latitude '213.2312.21'
  end

  factory :invalid_place, class: Place do
    name ''
    longitude ''
    latitude ''
  end
end
