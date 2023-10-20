FactoryBot.define do
  factory :group do
    name { 'Test Group' }
    icon { 'group_icon.png' }
    user
  end
end
