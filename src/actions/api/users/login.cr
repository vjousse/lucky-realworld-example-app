class Api::Users::Login::Create < ApiAction
  include Api::Auth::SkipRequireAuthToken

  route do
    SignInUser.new(params).submit do |operation, user|
      if user
        json UserSerializer.with_key(user)
      else
        raise Avram::InvalidOperationError.new(operation)
      end
    end
  end
end
