class ProfileSerializer < BaseSerializer
  def initialize(@user : User, @following : Bool)
  end

  def render
    {
      profile: {
        username: @user.username,
        bio: @user.bio,
        image: @user.image,
        following: @following
      }
    }
  end
end
