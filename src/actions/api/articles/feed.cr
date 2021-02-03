class Api::Articles::Feed < ApiAction

  param limit : Int32?
  param offset : Int32?

  get "/api/articles/feed" do
    articles_query = ArticleQuery.new.preload_tags.preload_author.preload_favoriting_users

    UserQuery.new.where_followers(UserQuery.new.id(current_user.id))
    # articles_query = articles_query.where_author()

    if limit_filter = limit
      articles_query = articles_query.limit(limit_filter)
    end

    if offset_filter = offset
      articles_query = articles_query.offset(offset_filter)
    end

    articles_query = articles_query.created_at.desc_order

    json ArticleSerializer.for_collection_with_key(articles_query, "articlesCount", current_user)
  end
end
