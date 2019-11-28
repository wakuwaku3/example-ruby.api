class UsersService
  def initialize(users_repository=nil)
    @users_repository=users_repository||UsersRepository.new
  end

  def create(args)
    @users_repository.create(args)
  end

  def validate_for_create(args)
    if args[:name].blank?
      return false
    end
    if args[:password].blank?
      return false
    end
    email=args[:email]
    if email.blank?
      return false
    end
    if !@users_repository.is_unique_email(email)
      return false
    end
    true
  end
end