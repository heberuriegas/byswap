class User < ActiveRecord::Base
  rolify
  attr_accessible :provider, :uid, :name, :email, :oauth_token, :oauth_token_expires, :oauth_token_expires_at
  validates_presence_of :name

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

  def extra_small_image
    "http://graph.facebook.com/#{self.uid}/picture?width=30&height=30"
  end

  def small_image
    "http://graph.facebook.com/#{self.uid}/picture?width=50&height=50"
  end

  def medium_image
    "http://graph.facebook.com/#{self.uid}/picture?width=200&height=200"
  end

  def large_image
    "http://graph.facebook.com/#{self.uid}/picture?width=600&height=600"
  end

  def friend_list
    graph.get_connections("me", "friends").map{ |t| { id: t['id'], name: t['name'] } }
  end

  def mutual_friends uid
    graph.get_connections("me", "mutualfriends/#{uid}")
  end

  private

  def graph
    @graph ||= Koala::Facebook::API.new(self.oauth_token)
  end

end
