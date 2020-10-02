class Api::Articles::Create < ApiAction
  post "/api/articles" do

    article = SaveArticle.create!(params, author_id: current_user.id)

    if tags = params.from_json["article"]["tagList"].as_a
      tags.map(&.as_s).each do |name|

        SaveTag.create(name: name) do |operation, created_tag|
          if created_tag
            tagging = SaveTagging.create!(article_id: article.id, tag_id: created_tag.id)
          else
            new_tag = TagQuery.new.name(name).first

            if !article.reload(&.preload_tags).tags.includes?(new_tag)
              tagging = SaveTagging.create!(article_id: article.id, tag_id: new_tag.id)
            end

          end
        end

      end
    end

    json ArticleSerializer.new(article.reload(&.preload_tags))
  end
end
