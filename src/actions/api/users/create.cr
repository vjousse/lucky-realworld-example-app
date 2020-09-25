class Api::Users::Create < ApiAction
  include Api::Auth::SkipRequireAuthToken

  route do
    user = SignUpUser.create!(params)
    json UserSerializer.new(user)
  end
end
