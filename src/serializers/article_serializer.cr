class ArticleSerializer < BaseSerializer
  def initialize(@article : Article, @user : (User|Nil) = nil)
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
      favorited: @article.favoriting_users.includes?(@user),
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
