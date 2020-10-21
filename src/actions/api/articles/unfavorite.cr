class Api::Articles::Unfavorite < ApiAction

  delete "/api/articles/:slug/favorite" do
    article = ArticleQuery.new.slug(slug).first

    FavoritingQuery.new.user_id(current_user.id).article_id(article.id).delete

    json ArticleSerializer.with_key(article.reload(&.preload_tags.preload_author.preload_favoriting_users), current_user)

  end
end

