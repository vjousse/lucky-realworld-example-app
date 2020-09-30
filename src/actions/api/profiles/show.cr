class Api::Profiles::Show < ApiAction

  include Api::Auth::SkipRequireAuthToken

  get "/api/profiles/:username" do
    user = UserQuery.new.username(username).first

    json ProfileSerializer.new(
      user,
      FollowQuery.new.is_following(current_user, user)
    )
  end
end
