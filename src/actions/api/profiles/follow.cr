class Api::Profiles::Follow < ApiAction

  post "/api/profiles/:username/follow" do
    user = UserQuery.new.username(username).first

    already_following = FollowQuery.new.follower_id(current_user.id).following_id(user.id).first

    FollowProfile.create!(follower_id: current_user.id, following_id: user.id) unless already_following

    json ProfileSerializer.new(user, true)
  end
end
