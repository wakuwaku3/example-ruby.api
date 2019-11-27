class UsersService
  def create(args)
    uuid = SecureRandom.uuid
    User.create(name: args[:name],password: args[:password],uuid:uuid,email:args[:email])
    return uuid
  end

  def validate_for_create(args)
    if args[:name].blank?
      return false
    end
    if args[:password].blank?
      return false
    end
    if args[:email].blank?
      return false
    end
    return true
  end
end