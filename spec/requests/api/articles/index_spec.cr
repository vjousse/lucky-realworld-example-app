require "../../../spec_helper"

describe Api::Articles::Index do
  it "returns a list of articles" do
    article1 = ArticleBox.create.reload(&.preload_author)
    article2 = ArticleBox.create.reload(&.preload_author)
    article3 = ArticleBox.create.reload(&.preload_author)

    response = ApiClient.auth(article1.author).exec(Api::Articles::Index)

    json_response = JSON.parse(response.body)

    json_response["articlesCount"].as_i.should eq(3)
    response.status_code.should eq(200)
  end

end

