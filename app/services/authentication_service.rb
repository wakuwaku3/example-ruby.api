class AuthenticationService
  def initialize(jwt_service=nil,users_repository=nil,system_clock=nil)
    @jwt_service = jwt_service || JwtService.new
    @users_repository=users_repository||UsersRepository.new
    @system_clock=system_clock||SystemClock.new
  end

  def validate_for_authenticate(args)
    !args[:email].blank? && !args[:password].blank?
  end

  def authenticate(args)
    @users_repository.authenticate(args[:email],args[:password])
  end

  def create_sign_in_token(args)
    expires_at=@system_clock.now+1.days
    @jwt_service.encode(args.dup.merge({expires_at:expires_at}))
  end

  def authenticate_by_token(args)
    payload=@jwt_service.decode(args[:token])
    if !payload.present?
      return nil
    end
    if payload['expires_at'] < @system_clock.now
      return nil
    end
    email=payload['email']
    user=@users_repository.find_user_by_email(email)
    if !user
      return nil
    end
    user
  end
end