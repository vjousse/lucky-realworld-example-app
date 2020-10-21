class Api::Articles::Show < ApiAction
  get "/api/articles/:slug" do
    article = ArticleQuery.new.slug(slug).preload_tags.preload_author.preload_favoriting_users.first

    json ArticleSerializer.with_key(article, current_user)
  end
end
