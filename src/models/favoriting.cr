class Favoriting < BaseModel
  table do
    belongs_to article : Article
    belongs_to user : User
  end
end
