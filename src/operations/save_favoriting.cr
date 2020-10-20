class SaveFavoriting < Favoriting::SaveOperation
  permit_columns article_id, user_id
end

