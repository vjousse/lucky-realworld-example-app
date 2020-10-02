abstract class BaseSerializer < Lucky::Serializer

  def self.for_collection(collection : Enumerable, *args, **named_args)
    collection.map do |object|
      new(object, *args, **named_args)
    end
  end

  def self.with_key(object, key=nil, *args, **named_args)
    {
      self.single_key => new(object, *args, **named_args)
    }
  end


  def self.for_collection_with_key(collection : Enumerable, *args, **named_args)
    {
      self.collection_key => collection.map do |object|
        new(object, *args, **named_args)
      end
    }
  end

end
