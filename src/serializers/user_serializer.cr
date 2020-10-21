class UserSerializer < BaseSerializer
  def initialize(@user : User)
  end

  def render
    {
      email: @user.email,
      username: @user.username,
      bio: @user.bio,
      image: @user.image,
      token: UserToken.generate(@user)
    }
  end


  def render_for_article
    {
      username: @user.username,
      bio: @user.bio,
      image: @user.image,
      following: false
    }
  end

  def self.single_key
    "user"
  end

end
