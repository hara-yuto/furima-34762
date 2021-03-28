FactoryBot.define do
  factory :credit_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code         { '000-0000' }
    area_id           {2}
    city              { '横浜市緑区' }
    house_number      { '青山1-1-1' }
    phone_number      { '00000000000'}

    

  end
end
