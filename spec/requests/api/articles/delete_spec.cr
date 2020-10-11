require "../../../spec_helper"

describe Api::Articles::Delete do
  it "returns 204 if deleted" do
    article = ArticleBox.create.reload(&.preload_author)

    response = ApiClient.auth(article.author).exec(Api::Articles::Delete.with(article.slug))

    ArticleQuery.new.select_count.should eq(0)
    response.status_code.should eq(204)
  end

end
