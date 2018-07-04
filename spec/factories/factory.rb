FactoryBot.define do
  factory :user do
    username "apoc64"
    oauthtoken Rails.application.credentials.github[:test_token]
  end
end
