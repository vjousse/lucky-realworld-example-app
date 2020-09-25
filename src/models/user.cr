class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table do
    column bio : String?
    column email : String
    column encrypted_password : String
    column username : String
    column image : String?
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end
end
