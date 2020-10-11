class CreateTagging::V20201001091858 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Tagging) do
      # Not useful to me as the couple follower/following
      # should be the primary key. But I don't know how to
      # do differently for now.
      primary_key id : Int64
      add_timestamps
      add_belongs_to article : Article, on_delete: :cascade
      add_belongs_to tag : Tag, on_delete: :cascade
    end

    execute <<-SQL
      ALTER TABLE taggings ADD CONSTRAINT tagging_unique UNIQUE (article_id, tag_id);
    SQL
  end

  def rollback
    execute <<-SQL
      ALTER TABLE taggings DROP CONSTRAINT tagging_unique;
    SQL

    drop :tagging
  end
end
