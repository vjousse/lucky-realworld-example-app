class Follow < BaseModel
  table do
    belongs_to following : User
    belongs_to follower : User
  end
end
