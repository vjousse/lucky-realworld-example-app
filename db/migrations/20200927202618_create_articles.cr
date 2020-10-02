class CreateArticles::V20200927202618 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Article) do
      primary_key id : Int64
      add_timestamps
      add slug : String, unique: true
      add title : String
      add body : String
      add description : String
      add_belongs_to author : User, on_delete: :cascade
    end
  end

  def rollback
    drop table_for(Article)
  end
end
