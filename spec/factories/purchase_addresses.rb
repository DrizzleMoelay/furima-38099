FactoryBot.define do
  factory :purchase_address do
    postal_code      {"123-4567"}
    shipping_area_id {3}
    city             {"横浜市"}
    street_no        {"青山1-1-1"}
    phone_no         {"09000000000"}
    token            {"tok_abcdefghijk00000000000000000"}
  end
end
