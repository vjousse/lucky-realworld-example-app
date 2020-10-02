class Api::Articles::Update < ApiAction
  put "/api/articles/:slug" do

    article = ArticleQuery.new.slug(slug).first
    SaveArticle.update(article, params) do |operation, updated_article|

      ArticleQuery.new.add_tags(
        updated_article,
        params.from_json["article"]["tagList"].as_a.map(&.as_s)
      )
    end

    json ArticleSerializer.with_key(article.reload(&.preload_tags))

  end
end
