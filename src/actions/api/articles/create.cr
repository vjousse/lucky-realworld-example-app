class Api::Articles::Create < ApiAction
  post "/api/articles" do

    article = SaveArticle.create!(params, author_id: current_user.id)

    tag = SaveTag.create!(name: "Testtag")

    tagging = SaveTagging.create!(article_id: article.id, tag_id: tag.id)

    json ArticleSerializer.new(article.reload(&.preload_tags))
  end
end
