require "../../../spec_helper"

describe Api::Me::Update do
  it "returns the updated user" do
    user = UserBox.create

    response = ApiClient.auth(user).exec(Api::Me::Update, user: valid_params)

    response.should send_json(
      200, 
      user: { 
        email: valid_params[:email],
        username: user.username,
        bio: valid_params[:bio],
        image: valid_params[:image],
        token: UserToken.generate(user)
      }
    )
  end

end


private def valid_params
  {
    email: "jake@jake.jake",
    bio: "I like to skateboard",
    image: "https://i.stack.imgur.com/xHWG8.jpg"
  }
end
