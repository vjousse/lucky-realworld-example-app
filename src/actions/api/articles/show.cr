class Api::Articles::Show < ApiAction
  get "/api/articles/:slug" do
    article = ArticleQuery.new.slug(slug).preload_tags.first
    json ArticleSerializer.with_key(article)
  end
end
