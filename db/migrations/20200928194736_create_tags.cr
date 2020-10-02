class CreateTags::V20200928194736 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Tag) do
      primary_key id : Int64
      add_timestamps
      add name : String, unique: true
    end
  end

  def rollback
    drop table_for(Tag)
  end
end
