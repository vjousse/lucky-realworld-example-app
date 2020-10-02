class Api::Articles::Delete < ApiAction

  delete "/api/articles/:slug" do
    article = ArticleQuery.new.slug(slug).preload_tags.first
    article.delete

    head 204
  end
end
