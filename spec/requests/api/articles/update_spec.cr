require "../../../spec_helper"

tf = Time::Format.new("%FT%H:%M:%S.%LZ")

describe Api::Articles::Update do
  it "returns the updated article" do
    article = ArticleBox.create.reload(&.preload_author)

    response = ApiClient.auth(article.author).exec(Api::Articles::Update.with(article.slug), article: valid_params)

    response.should send_json(
      200,
      article: {
        title: valid_params[:title],
        slug: article.slug,
        description: valid_params[:description],
        body: article.body,
        tagList: [] of String,
        createdAt: tf.format(article.created_at),
        updatedAt: tf.format(article.updated_at),
        favorited: false,
        favoritesCount: 0,
        author: {
          username: "test-username-1",
          bio: nil,
          image: nil,
          following: false
        }
      }
    )
  end

end


private def valid_params
  {
    title: "hop",
    description: "another description",
  }
end
