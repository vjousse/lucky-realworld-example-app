class Api::Profiles::Follow < ApiAction

  post "/api/profiles/:username/follow" do
    user = UserQuery.new.username(username).first

    FollowProfile.create!(follower_id: current_user.id, following_id: user.id)

    json ProfileSerializer.new(user, true)
  end
end
