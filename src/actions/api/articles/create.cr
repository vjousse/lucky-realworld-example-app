class Api::Articles::Create < ApiAction
  post "/api/articles" do
    article = SaveArticle.create!(params)

    json ArticleSerializer.new(article)
  end
end
