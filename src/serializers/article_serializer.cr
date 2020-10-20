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
      createdAt: @tf.format(@article.created_at),
      updatedAt: @tf.format(@article.updated_at),
      favorited: false,
      favoritesCount: @article.favoriting_users.size,
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
