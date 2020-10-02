class Api::Articles::Create < ApiAction
  post "/api/articles" do

    article = SaveArticle.create!(params, author_id: current_user.id)

    ArticleQuery.new.add_tags(
      article,
      params.from_json["article"]["tagList"].as_a.map(&.as_s)
    )

    json ArticleSerializer.new(article.reload(&.preload_tags))
  end
end
