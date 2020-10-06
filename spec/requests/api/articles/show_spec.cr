require "../../../spec_helper"

describe Api::Articles::Show do
  it "returns 401 if not authenticated" do

    article = ArticleBox.create
    response = ApiClient.exec(Api::Articles::Show.with(article.slug))

    response.status_code.should eq(401)
  end


  it "is ok if authenticated" do
    article = ArticleBox.create.reload(&.preload_author)

    response = ApiClient.auth(article.author).exec(Api::Articles::Show.with(article.slug))


    json_response = JSON.parse(response.body)

    response.status_code.should eq(200)
    json_response["article"]["title"].as_s.should eq(article.title)
  end


  it "returns 404 if not found" do
    user = UserBox.create

    response = ApiClient.auth(user).exec(Api::Articles::Show.with("unknow"))

    response.status_code.should eq(404)
  end
end
