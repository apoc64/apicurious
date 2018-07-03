class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(username: auth.info.nickname).first_or_initialize.tap do |user|
      user.username = auth.info.nickname
      user.oauthtoken = auth.credentials.token

      user.save!
    end
  end
end
