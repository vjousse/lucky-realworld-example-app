class SaveArticle < Article::SaveOperation
  permit_columns title, description, body

  before_save do
    AvramSlugify.set slug,
      using: title,
      query: ArticleQuery.new
  end

end
