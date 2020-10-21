require "../../../spec_helper"

describe Api::Articles::Unfavorite do
  it "unfavorites a previously favorited post" do
    article = ArticleBox.create.reload(&.preload_author)

    # Favorite the post
    f_response = ApiClient.auth(article.author).exec(Api::Articles::Favorite.with(article.slug))

    # Unfavorite it
    uf_response = ApiClient.auth(article.author).exec(Api::Articles::Unfavorite.with(article.slug))


    f_json_response = JSON.parse(f_response.body)
    uf_json_response = JSON.parse(uf_response.body)

    f_json_response["article"]["favorited"].should be_true
    uf_json_response["article"]["favorited"].should be_false
  end

end
