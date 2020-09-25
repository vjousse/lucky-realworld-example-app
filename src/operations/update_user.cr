class UpdateUser < User::SaveOperation
  param_key :user

  permit_columns bio, email, image, username
  attribute password : String

  before_save do
    validate_uniqueness_of email
    validate_uniqueness_of username
    Authentic.copy_and_encrypt password, to: encrypted_password
  end
end
