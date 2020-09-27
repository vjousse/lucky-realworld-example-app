class Article < BaseModel
  table do
    column slug : String
    column title : String
    column description : String
    column body : String
  end
end
