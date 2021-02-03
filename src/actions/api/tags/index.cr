class Api::Tags::Index < ApiAction
  include Api::Auth::SkipRequireAuthToken

  get "/api/tags" do
    tags_query = TagQuery.new

    json TagSerializer.for_collection_with_key(tags_query)
  end
end
