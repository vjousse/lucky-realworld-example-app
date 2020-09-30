class CreateFollow::V20200926141022 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Follow) do
      # Not useful to me as the couple follower/following
      # should be the primary key. But I don't know how to
      # do differently for now.
      primary_key id : Int64
      add_timestamps
      add_belongs_to follower : User, on_delete: :cascade
      add_belongs_to following : User, on_delete: :cascade
    end

    execute <<-SQL
      ALTER TABLE follows ADD CONSTRAINT follow_unique UNIQUE (follower_id, following_id);
    SQL

  end

  def rollback
    drop table_for(Follow)

    execute <<-SQL
      ALTER TABLE follows DROP CONSTRAINT follow_unique;
    SQL
  end
end
