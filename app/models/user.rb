# User and authentication
class User < ActiveRecord::Base
  has_one :pet

  def self.omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.token = auth.credentials.token
      user.expires_at = Time.zone.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
