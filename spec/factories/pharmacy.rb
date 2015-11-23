FactoryGirl.define do
  factory :pharmacy do
    name "Chemical Warehouse"

    trait :late_night_thursday do
      open_periods {
        [build(:open_period, day: "Thursday", time_to: "21:00")]
      }
    end
  end

  factory :open_period do
  end
end
