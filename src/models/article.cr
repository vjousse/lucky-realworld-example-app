class Article < BaseModel
  table do
    column slug : String
    column title : String
    column description : String
    column body : String
    belongs_to author : User
    has_many taggings : Tagging
    has_many tags : Tag, through: :taggings
  end
end
