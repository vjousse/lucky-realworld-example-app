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

  it "filters with author" do
    article1 = ArticleBox.create.reload(&.preload_author)
    article2 = ArticleBox.create.reload(&.preload_author)
    article3 = ArticleBox.create.reload(&.preload_author)

    response = ApiClient
      .auth(article1.author)
      .exec(Api::Articles::Index.with(author: article1.author.username))

    json_response = JSON.parse(response.body)
    json_response["articlesCount"].as_i.should eq(1)
    json_response["articles"][0]["author"]["username"].should eq(article1.author.username)

  end


  it "filters with favorited" do
    article1 = ArticleBox.create.reload(&.preload_author)
    article2 = ArticleBox.create.reload(&.preload_author)
    article3 = ArticleBox.create.reload(&.preload_author)

    ApiClient.auth(article1.author).exec(Api::Articles::Favorite.with(article1.slug))

    response = ApiClient
      .auth(article1.author)
      .exec(Api::Articles::Index.with(favorited: article1.author.username))

    json_response = JSON.parse(response.body)
    json_response["articlesCount"].as_i.should eq(1)
    json_response["articles"][0]["favorited"].should be_true

  end

  it "filters with limit" do
    limit = 2
    article1 = ArticleBox.create.reload(&.preload_author)
    article2 = ArticleBox.create.reload(&.preload_author)
    article3 = ArticleBox.create.reload(&.preload_author)

    response = ApiClient.auth(article1.author).exec(Api::Articles::Index.with(limit: limit))

    json_response = JSON.parse(response.body)

    json_response["articlesCount"].as_i.should eq(limit)
    response.status_code.should eq(200)
  end


  it "filters with offset" do
    offset = 1
    article1 = ArticleBox.create.reload(&.preload_author)
    article2 = ArticleBox.create.reload(&.preload_author)
    article3 = ArticleBox.create.reload(&.preload_author)
    article4 = ArticleBox.create.reload(&.preload_author)

    response = ApiClient
      .auth(article1.author)
      .exec(Api::Articles::Index.with(offset: offset))

    json_response = JSON.parse(response.body)

    json_response["articlesCount"].as_i.should eq(4-offset)
    response.status_code.should eq(200)
  end

end
