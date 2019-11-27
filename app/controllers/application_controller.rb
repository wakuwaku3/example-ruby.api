class ApplicationController < ActionController::API
  before_action :authenticate
  before_action :require_sign_in
  helper_method :signed_in?
  helper_method :user

  def initialize(options={})
    @user = nil
    @authentication_usecase = options[:authentication_usecase] || AuthenticationUsecase.new
  end

  def authenticate
    token = request.headers[:Authorization]
    if !token.present?
      return nil
    end
    if token.downcase.start_with?("bearer")
      token=token[7,token.length]
    end

    @user ||= @authentication_usecase.authenticate({token:token})
    return @user
  end

  def signed_in?
    return @user.present?
  end

  def user
    return @user
  end

  private
    def require_sign_in
      if !signed_in?
        render status: 401, json: { status: 401, message: 'Unauthorized' }
        return
      end
    end
end
