require "../../../spec_helper"

describe Api::Profiles::Follow do
  it "follows an user" do
    user = UserBox.create

    if username = user.username
      response = ApiClient.auth(user).exec(Api::Profiles::Follow.with(username))

      response.should send_json(200, profile: { username: username, bio: user.bio, image: user.image, following: true })
    else
      false
    end
  end

end
