FactoryGirl.define do
  factory :player do
    name "Ana"
    email "email@test.com"
    wins 0
    losses 0
    password "12345678"

    trait :player_b do
      name "Lucas"
      email "test@email.com"
      wins 0
      losses 0
      password "12345678"
    end
  end

end
