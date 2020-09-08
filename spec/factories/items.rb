FactoryBot.define do
  factory :item do
    category_id { 2 }
    brand_id { 2 }
    color_id { 2 }
    size_id { 2 }

    association :user
  end
end
