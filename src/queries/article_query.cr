class ArticleQuery < Article::BaseQuery

  def add_tags(article : Article, tags : Array(String))

    tags.each do |name|

      SaveTag.create(name: name) do |operation, created_tag|
        if created_tag
          SaveTagging.create!(article_id: article.id, tag_id: created_tag.id)
        else
          new_tag = TagQuery.new.name(name).first

          if !article.reload(&.preload_tags).tags.includes?(new_tag)
            SaveTagging.create!(article_id: article.id, tag_id: new_tag.id)
          end

        end
      end

    end

  end
end
