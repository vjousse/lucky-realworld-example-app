class Api::Profiles::Show < ApiAction

  include Api::Auth::SkipRequireAuthToken

  get "/api/profiles/:username" do
    user = UserQuery.new.username(username).first

    if logged_in_user = current_user
      follow = FollowQuery.new.follower_id(logged_in_user.id).following_id(user.id).any?
    else
      follow = false
    end

    json ProfileSerializer.new(user, follow)
  end
end
