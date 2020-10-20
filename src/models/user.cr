class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table do
    column bio : String?
    column email : String
    column encrypted_password : String
    column username : String?
    column image : String?
    has_many followers : User, through: :follow
    has_many followings : User, through: :follow

    has_many favoritings : Favoriting
    has_many favorited_articles : Article, through: :favoritings
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end
end
