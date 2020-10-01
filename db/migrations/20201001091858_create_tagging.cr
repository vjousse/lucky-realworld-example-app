class CreateTagging::V20201001091858 < Avram::Migrator::Migration::V1
  def migrate
    create :tagging do
      # Not useful to me as the couple follower/following
      # should be the primary key. But I don't know how to
      # do differently for now.
      primary_key id : Int64
      add_timestamps
      add_belongs_to user : User, on_delete: :cascade
      add_belongs_to tag : Tag, on_delete: :cascade
    end

    execute <<-SQL
      ALTER TABLE tagging ADD CONSTRAINT tagging_unique UNIQUE (user_id, tag_id);
    SQL
  end

  def rollback
    execute <<-SQL
      ALTER TABLE tagging DROP CONSTRAINT tagging_unique;
    SQL

    drop :tagging
  end
end
