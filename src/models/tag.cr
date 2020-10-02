class Tag < BaseModel
  table do
    column name : String
    has_many taggings : Tagging
    has_many articles : Article, through: :taggings
  end
end
