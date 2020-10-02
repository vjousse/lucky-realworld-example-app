class ArticleSerializer < BaseSerializer
  def initialize(@article : Article)
  end

  def render
    {
      article: {
        title: @article.title,
        slug: @article.slug,
        description: @article.description,
        body: @article.body,
        tagList: @article.tags.map(&.name)
      }
    }
  end
end
