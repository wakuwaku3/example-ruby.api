class UsersRepository
  def create(args)
    User.create(name: args[:name],password: args[:password],email:args[:email])
  end
  
  def is_unique_email(email)
    User.where(email: email).count == 0
  end
  
  def find_user_by_email(email)
    User.find_by(email: email)
  end
  
  def authenticate(email,password)
    user=User.find_by(email: email)
    user && user.authenticate(password)
  end
end