class Api::Articles::Update < ApiAction
  put "/api/articles/:slug" do

    article = ArticleQuery.new.slug(slug).first

    SaveArticle.update(article, params) do |operation, updated_article|
      if params.from_json["article"]["tagList"]?
        ArticleQuery.new.add_tags(
          updated_article,
          params.from_json["article"]["tagList"].as_a.map(&.as_s)
        )
      end
    end

    json ArticleSerializer.with_key(article.reload(&.preload_tags.preload_author.preload_favoriting_users))

  end
end
