class ApplicationController < ActionController::API
  before_action :authenticate
  before_action :require_sign_in
  helper_method :signed_in?
  helper_method :user
  helper_method :authentication_usecase

  def initialize(authentication_usecase=nil)
    @user = nil
    @authentication_usecase = authentication_usecase || AuthenticationUsecase.new
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
    @user
  end

  def signed_in?
    @user.present?
  end

  def user
    @user
  end

  def authentication_usecase
    @authentication_usecase
  end

  private
    def require_sign_in
      if !signed_in?
        return  render status: 401, json: { status: 401, message: 'Unauthorized' }
      end
    end
end
