class Api::Me::Show < ApiAction
  get "/api/user" do
    json UserSerializer.with_key(current_user)
  end
end
