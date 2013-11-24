class AddOauthTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_token_expires_at, :integer, limit: 8
    add_column :users, :oauth_token_expires, :boolean
  end
end
