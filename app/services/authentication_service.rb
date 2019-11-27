class AuthenticationService
  def initialize(options={})
    @jwt_service = options[:jwt_service] || JwtService.new
  end

  def validate_for_authenticate(args)
    email=args[:email]
    password=args[:password]
    if password.blank?
      return false
    end
    if email.blank?
      return false
    end
    return true
  end

  def authenticate(args)
    email=args[:email]
    password=args[:password]
    user=User.find_by(email: email)
    if !user || !user.authenticate(password)
      return nil,false
    end
    return {uuid:user.uuid},true
  end

  def create_sign_in_token(args)
    expires_at=Time.zone.now+1.days
    return @jwt_service.encode(args.dup.merge({expires_at:expires_at}))
  end

  def authenticate_by_token(args)
    payload=@jwt_service.decode(args[:token])
    if !payload.present?
      return nil
    end
    if payload['expires_at'] < Time.zone.now
      return nil
    end
    email=payload['email']
    user=User.find_by(email: email)
    if !user
      return nil
    end
    return user
  end
end