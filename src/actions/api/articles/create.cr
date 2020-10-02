class Api::Articles::Create < ApiAction
  post "/api/articles" do

    article = SaveArticle.create!(params, author_id: current_user.id)

    SaveTag.create(name: "Testtag") do |operation, tag|
      if tag
        tagging = SaveTagging.create!(article_id: article.id, tag_id: tag.id)
      else
        new_tag = TagQuery.new.name("Testtag").first

        tagging = SaveTagging.create!(article_id: article.id, tag_id: new_tag.id)
      end
    end

    json ArticleSerializer.new(article.reload(&.preload_tags))
  end
end
