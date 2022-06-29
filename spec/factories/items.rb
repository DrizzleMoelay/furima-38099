FactoryBot.define do
  factory :item do

    name               {"mango"}
    description        {"aaa"}
    category_id        {3}
    status_info_id     {3}
    shipping_charge_id {3}
    shipping_area_id   {3}
    days_to_ship_id    {3}
    price              {3333}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end
