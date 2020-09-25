class AddMissingUserFields::V20200925193332 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(User) do
      add bio : String?
      add image : String?
      add username : String?, unique: true
    end
  end

  def rollback
    alter table_for(User) do
      remove :bio
      remove :image
      remove :username
    end
  end
end
