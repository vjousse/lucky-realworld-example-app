require "../../../spec_helper"

tf = Time::Format.new("%FT%H:%M:%S.%LZ")

describe Api::Articles::Favorite do
  it "returns a favorited article" do
    article = ArticleBox.create.reload(&.preload_author)

    response = ApiClient.auth(article.author).exec(Api::Articles::Favorite.with(article.slug))

    json_response = JSON.parse(response.body)
    json_response["article"]["favorited"].should be_true
  end

end
