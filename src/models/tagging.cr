class Tagging < BaseModel
  table do
    belongs_to article : Article
    belongs_to tag : Tag
  end
end
