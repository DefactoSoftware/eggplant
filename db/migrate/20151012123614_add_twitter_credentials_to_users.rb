class AddTwitterCredentialsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_twitter_token, :string
    add_column :users, :encrypted_twitter_secret, :string
  end
end
