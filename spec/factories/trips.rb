FactoryGirl.define do
  factory :group2, class: Group do
    name 'G3'
  end

  factory :group3, class: Group do
    name 'G4'
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

  factory :user2, class: User do
    first_name 'Jason'
    last_name 'Statim'
    phone_number '0120010100'
    group_id 1
    home_place_id 1
    work_place_id 2
  end

  factory :user3, class: User do
    first_name 'Van'
    last_name 'Disel'
    phone_number '0120010100'
    group_id 2
    home_place_id 1
    work_place_id 2
  end

  factory :user4, class: User do
    first_name 'John'
    last_name 'Cena'
    phone_number '0120010100'
    group_id 1
    home_place_id 1
    work_place_id 2
  end

  factory :trip do
    driver_id 1
    source_id 1
    destination_id 2
    departure_time '2030'
    seats 1
  end

  factory :invalid_trip, class: Trip do
    driver_id 1
    source_id 1
    destination_id 2
    departure_time ''
    seats 3
  end
end
