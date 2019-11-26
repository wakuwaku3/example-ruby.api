class JwtService
  def encode(args)
    data = { userid: args[:uuid] }
    return JWT.encode(data, Rails.application.secrets.secret_key_base, "HS256")
  end
end