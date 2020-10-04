require "../../../spec_helper"

describe Api::Articles::Show do
  it "401 if not authenticated" do

    article = ArticleBox.create
    response = ApiClient.exec(Api::Articles::Show.with(article.slug))

    response.status_code.should eq(401)
  end


  it "ok if authenticated" do
    article = ArticleBox.create.reload(&.preload_author)

    response = ApiClient.auth(article.author).exec(Api::Articles::Show.with(article.slug))

    response.status_code.should eq(200)
  end
end
