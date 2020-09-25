class UserSerializer < BaseSerializer
  def initialize(@user : User)
  end

  def render
    {
      user: {
        email: @user.email,
        username: @user.username,
        bio: @user.bio,
        image: @user.image,
        token: UserToken.generate(@user)
      }
    }
  end
end
