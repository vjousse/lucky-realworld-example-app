class ArticleSerializer < BaseSerializer
  def initialize(@article : Article)
  end

  def render
    {
      title: @article.title,
      slug: @article.slug,
      description: @article.description,
      body: @article.body,
      tagList: @article.tags.map(&.name)
    }
  end

  def self.with_key(object, *args, **named_args)
    {
      self.single_key => new(object, *args, **named_args)
    }
  end


  def self.for_collection(collection : Enumerable, *args, **named_args)
    {
      self.collection_key => collection.map do |object|
        new(object, *args, **named_args)
      end
    }
  end


  def self.collection_key
    "articles"
  end


  def self.single_key
    "article"
  end

end
