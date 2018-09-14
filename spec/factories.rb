FactoryBot.define do

  factory :user do
    sequence(:email){ |n| "testuser-#{n}@test.com" }
    password "test"
    trait(:doctor) do
      role { build(:doctor) }
    end
    trait(:patient) do
      role { build(:patient) }
    end
  end

  factory :specialty do
    name "Tester"
  end

  factory :doctor do
    first_name "Ben"
    last_name "Krigel"
    location_city "Washington, D.C."
    years_in_practice { 7 }
    specialty
  end

  factory :patient do
    first_name "Raffi"
    last_name "Krigel"
  end

  factory :ailment do
    description "bloody nose"
    first_noticed_on { 1.days.ago }
    resolved_status false
    patient
  end

  factory :appointment do
    scheduled_for { today }
    duration_in_minutes { 1 }
    doctor
    patient
    ailment
  end

  factory :prescription do
    drug "Placebo"
    dosage_in_milligrams { 500 }
    appointment
  end

end
