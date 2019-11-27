class AuthenticationUsecase
  def initialize(options={})
    @users_service = options[:users_service] || UsersService.new
    @authentication_service = options[:authentication_service] || AuthenticationService.new
  end
  
  def sign_up(args)
    if !@users_service.validate_for_create(args)
      return nil, false
    end
    uuid = @users_service.create(args)
    token = @authentication_service.create_sign_in_token({userid:uuid,email:args[:email]})
    return {token:token}, true
  end
  
  def sign_in(args)
    if !@authentication_service.validate_for_authenticate(args)
      return nil, 400
    end
    user,successed=@authentication_service.authenticate(args)
    if !successed
      return nil, 401
    end
    token = @authentication_service.create_sign_in_token({userid:user[:uuid],email:args[:email]})
    return {token:token}, 200
  end

  def authenticate(args)
    return @authentication_service.authenticate_by_token(args)
  end
end