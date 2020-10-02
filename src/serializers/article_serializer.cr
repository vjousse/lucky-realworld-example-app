class ArticleSerializer < BaseSerializer
  def initialize(@article : Article)
  end

  def render
    {
      title: @article.title,
      slug: @article.slug,
      description: @article.description,
      body: @article.body,
      tagList: @article.tags.map(&.name),
      createdAt: @article.created_at,
      updatedAt: @article.updated_at,
      favorited: false,
      favoritesCount: 0,
      author: UserSerializer.new(@article.author).render_for_article
    }
  end

  def self.collection_key
    "articles"
  end


  def self.single_key
    "article"
  end

end
