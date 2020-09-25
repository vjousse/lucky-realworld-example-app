class Api::Me::Update < ApiAction
  put "/api/user" do
    user = UpdateUser.update!(current_user, params)
    json UserSerializer.new(user)
  end
end
