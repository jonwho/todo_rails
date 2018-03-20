class User < ApplicationRecord
  has_many :todos

  def self.from_omniauth(auth)
    pre_existing_user = User.find_by_email(auth.info.email)
    return pre_existing_user if pre_existing_user.present?

    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.name             = auth.info.name
      user.email            = auth.info.email
      user.oauth_token      = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
