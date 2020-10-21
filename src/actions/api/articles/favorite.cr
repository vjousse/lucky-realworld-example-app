class Api::Articles::Favorite < ApiAction

  post "/api/articles/:slug/favorite" do
    article = ArticleQuery.new.slug(slug).first

    already_favoriting = FavoritingQuery.new.article_id(article.id).user_id(current_user.id).first?
    SaveFavoriting.create!(article_id: article.id, user_id: current_user.id) unless already_favoriting

    json ArticleSerializer.with_key(article.reload(&.preload_tags.preload_author.preload_favoriting_users), current_user)
  end
end
