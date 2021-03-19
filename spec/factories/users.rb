FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    first_name            {'原'}
    family_name           {'優斗'}
    first_name_kana        {'ハラ'}
    family_name_kana       {'ユウト'}
    birthday              {'1930-04-02'}

  end
end