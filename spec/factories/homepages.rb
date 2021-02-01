FactoryBot.define do
  factory :homepage11, class: User do
    title { "EG" }
    introduction { "This is an example" }
  end
  
  factory :homepage2, class: User do
    title { "Example" }
    introduction { "This is another example" }
  end
end