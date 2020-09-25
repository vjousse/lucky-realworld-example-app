class Api::Me::Update < ApiAction
  put "/api/user" do
    #TODO: update user
    json UserSerializer.new(current_user)
  end
end
