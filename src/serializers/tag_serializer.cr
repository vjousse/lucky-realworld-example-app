class TagSerializer < BaseSerializer
  def initialize(@tag : Tag)
  end

  def render
    @tag.name
  end

  def self.collection_key
    "tags"
  end


  def self.single_key
    "tag"
  end

end
