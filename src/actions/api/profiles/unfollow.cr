class Api::Profiles::Unfollow < ApiAction

  delete "/api/profiles/:username/follow" do
    user = UserQuery.new.username(username).first

    FollowQuery.new.follower_id(current_user.id).following_id(user.id).delete

    json ProfileSerializer.new(user, false)
  end
end
