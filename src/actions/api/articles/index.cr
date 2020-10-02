class Api::Articles::Index < ApiAction

  include Api::Auth::SkipRequireAuthToken

  get "/api/articles" do
    articles = ArticleQuery.new.preload_tags.preload_author
    json ArticleSerializer.for_collection_with_key(articles)
  end
end
