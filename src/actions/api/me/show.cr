class Api::Me::Show < ApiAction
  get "/api/user" do
    json UserSerializer.new(current_user)
  end
end
