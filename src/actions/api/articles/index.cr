class Api::Articles::Index < ApiAction
  include Api::Auth::SkipRequireAuthToken

  param tag : String?
  param author : String?
  param favorited : String?
  param limit : Int?
  param offset : Int?

  get "/api/articles" do
    articles_query = ArticleQuery.new.preload_tags.preload_author

    if tag_filter = tag
      articles_query = articles_query.where_tags(TagQuery.new.name(tag_filter))
    end


    if author_filter = author
      articles_query = articles_query.where_users(UserQuery.new.username(author_filter))
    end

    json ArticleSerializer.for_collection_with_key(articles_query, "articlesCount")
  end
end
