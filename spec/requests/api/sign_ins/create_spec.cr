require "../../../spec_helper"

describe Api::Users::Login::Create do
  it "returns a token" do
    UserToken.stub_token("fake-token") do
      user = UserBox.create

      response = ApiClient.exec(Api::Users::Login::Create, user: valid_params(user))

      response.should send_json(200, user: { email: user.email, username: user.username, bio: user.bio, image: user.image, token: "fake-token" })
    end
  end

  it "returns an error if credentials are invalid" do
    user = UserBox.create
    invalid_params = valid_params(user).merge(password: "incorrect")

    response = ApiClient.exec(Api::Users::Login::Create, user: invalid_params)

    response.should send_json(
      400,
      param: "password",
      details: "password is wrong"
    )
  end
end

private def valid_params(user : User)
  {
    email:    user.email,
    password: "password",
  }
end
