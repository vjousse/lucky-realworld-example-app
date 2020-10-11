class Api::Articles::Delete < ApiAction

  delete "/api/articles/:slug" do
    article = ArticleQuery.new.slug(slug).first
    article.delete

    head 204
  end
end
