class Article < BaseModel
  table do
    column slug : String
    column title : String
    column description : String
    column body : String
    belongs_to author : User
    has_many taggings : Tagging
    has_many tags : Tag, through: [:taggings, :tag]
    has_many favoritings : Favoriting
    has_many favoriting_users : User, through: [:favoritings, :user]
  end
end
