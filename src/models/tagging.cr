class Tagging < BaseModel
  table :tagging do
    belongs_to user : User
    belongs_to tag : Tag
  end
end
