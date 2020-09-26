require "../../../spec_helper"

describe Api::Users::Create do
  it "creates user on sign up" do
    UserToken.stub_token("fake-token") do
      response = ApiClient.exec(Api::Users::Create, user: valid_params)

      response.should send_json(200, user: { email: valid_params[:email], username: valid_params[:username], bio: valid_params[:bio], image: valid_params[:image], token: "fake-token" })

      new_user = UserQuery.first
      new_user.email.should eq(valid_params[:email])
    end
  end

  it "returns error for invalid params" do
    invalid_params = valid_params.merge(email: nil)

    response = ApiClient.exec(Api::Users::Create, user: invalid_params)

    UserQuery.new.select_count.should eq(0)
    response.should send_json(
      400,
      param: "email",
      details: "email is required"
    )
  end
end

private def valid_params
  {
    email:                 "test@email.com",
    password:              "password",
    username:              "test",
    bio:                   "Bio test",
    image:                 "http://awesome.com/image.png",
  }
end
