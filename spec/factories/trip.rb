FactoryGirl.define do
  factory :group2, class: Group do
    name 'G2'
  end

  factory :place3, class: Place do
    name 'Madineh-Nasr'
    longitude '12.21.213'
    latitude '213.2312.21'
  end

  factory :place4, class: Place do
    name 'ElShorouk'
    longitude '12.213.213'
    latitude '213.2312.21'
  end

  factory :user1, class: User do
    first_name 'John'
    last_name 'Doe'
    phone_number '0100010100'
    group_id 1
    home_place_id 1
    work_place_id 2
  end

  factory :trip do
    driver_id 1
    source_id 1
    destination_id 2
    departure_time 2030
    seats 3
  end
end
