FactoryBot.define do
    factory :datum do
    devise { Faker::Name.name }
    PM2_5 { rand(10).to_s}
    PM10 {rand(10).to_s }
    positive_feeling { rand(10) }
    mixed_feeling { rand(10) }
    negative_feeling { rand(10) }
    latitude {  rand(-90.000000000...90.000000000).to_s }
    longitude { rand(-180.000000000...180.000000000).to_s }
    end
end