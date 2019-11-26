class AuthenticationUsecase
  def initialize(options={})
    @users_service = options[:users_service] || UsersService.new
    @jwt_service = options[:jwt_service] || JwtService.new
  end
  def sign_up(args)
    if !@users_service.validate(args)
      return nil, false
    end
    uuid = @users_service.create(args)
    token = @jwt_service.encode({uuid:uuid})
    return {token:token}, true
  end
end