class CreateUsers::V00000000000001 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(User) do
      primary_key id : Int64
      add_timestamps
      add bio : String?
      add email : String, unique: true
      add encrypted_password : String
      add image : String?
      add username : String, unique: true
    end
  end

  def rollback
    drop table_for(User)
  end
end
