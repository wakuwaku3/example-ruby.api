class JwtService
  def encode(args)
    JWT.encode(args, Rails.application.secrets.secret_key_base, "HS256")
  end

  def decode(token)
    begin
      decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' })
    rescue Exception => e
      return nil
    end
    if !decoded_token.present? && decoded_token.length <1
      return nil
    end
    decoded_token[0]
  end
end