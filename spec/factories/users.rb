FactoryGirl.define do
  factory :group1, class: Group do
    name 'G2'
  end

  factory :place1, class: Place do
    name 'New-Cairo'
    longitude '12.213.213'
    latitude '213.2312.21'
  end

  factory :place2, class: Place do
    name 'Zamalek'
    longitude '12.213.213'
    latitude '213.2312.21'
  end

  factory :user do
    first_name 'John'
    last_name 'Doe'
    phone_number '0100010100'
    group_id 1
    home_place_id 1
    work_place_id 2
  end

  factory :invalid_user, class: User do
    first_name 'John'
    last_name 'Doe'
    phone_number '0100010100'
    group_id 1
    home_place_id 1
    work_place_id 2
  end
end
