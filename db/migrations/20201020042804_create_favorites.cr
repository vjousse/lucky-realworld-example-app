class CreateFavorites::V20201020042804 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Favoriting) do
      primary_key id : Int64
      add_timestamps
      add_belongs_to article : Article, on_delete: :cascade
      add_belongs_to user : User, on_delete: :cascade
    end

    execute <<-SQL
      ALTER TABLE favoritings ADD CONSTRAINT favoriting_unique UNIQUE (article_id, user_id);
    SQL
  end

  def rollback
    execute <<-SQL
      ALTER TABLE favoritings DROP CONSTRAINT favoriting_unique;
    SQL

    drop table_for(Favorite)
  end
end
