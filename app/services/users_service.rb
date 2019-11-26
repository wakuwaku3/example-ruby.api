class UsersService
  def create(args)
    uuid = SecureRandom.uuid
    User.create(name: args[:name],password: args[:password],uuid:uuid)
    return uuid
  end

  def validate(args)
    if args[:name].blank?
      return false
    end
    if args[:password].blank?
      return false
    end
    return true
  end
end