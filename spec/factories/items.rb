FactoryBot.define do
  factory :item do
    name         {Faker::Name.name}
    introduction {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    payer_id {2}
    area_id {2}
    delivery_day_id {2}
    price            {'300'}
    user_id {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
