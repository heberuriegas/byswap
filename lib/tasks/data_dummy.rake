namespace :data_dummy do
  desc "Generate data dummy for services"
  task :generate, [:number_of_publications, :number_of_users] => :environment do |t, args|

    require 'faker'

    args.with_defaults number_of_publications: 500
    args.with_defaults number_of_users: 50
    
    number_of_publications = args[:number_of_publications].to_i
    number_of_users = args[:number_of_users].to_i

    user = User.where('oauth_token is not null').sample

    raise "You need at least 1 user with oauth" unless user.present?

    friend_list = user.friend_list

    (0...number_of_users).each do |n|
      sample_user = friend_list.sample
      FactoryGirl.create :user, uid: sample_user[:id], name: sample_user[:name]
    end

    if User.count > 0
      (0...number_of_publications).each do |n|
        FactoryGirl.create :publication, user: User.all.sample, amount_currency: ['USD','CLP','MXN'].sample
      end
    else
      put "You need at least 1 user."
    end

  end
end
