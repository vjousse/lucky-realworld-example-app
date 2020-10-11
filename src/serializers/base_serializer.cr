abstract class BaseSerializer < Lucky::Serializer

  @tf = Time::Format.new("%FT%H:%M:%S.%LZ")

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


  def self.for_collection_with_key(collection : Enumerable, countString=nil, *args, **named_args)

    result = {
      self.collection_key => collection.map do |object|
        new(object, *args, **named_args)
      end
    }

    if countString
      result = result.merge({countString => collection.size})
    end

    return result

  end

end
