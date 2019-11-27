class AuthenticationController < ApplicationController
  skip_before_action :require_sign_in, only: [:sign_up, :sign_in]
  
  def initialize(options={})
    @authentication_usecase = options[:authentication_usecase] || AuthenticationUsecase.new
  end
  
  def sign_up
    json_request = JSON.parse(request.body.read)
    result,state = @authentication_usecase.sign_up({
      name:json_request['name'],
      password:json_request['password'],
      email:json_request['email'],
    })
    if !state
      render status: 400, json: { status: 400, message: 'Bad Request' }
      return
    end
    render plain: result[:token]
  end
  
  def sign_in
    json_request = JSON.parse(request.body.read)
    result,status = @authentication_usecase.sign_in({
      email:json_request['email'],
      password:json_request['password'],
    })
    if status==400
      render status: 400, json: { status: 400, message: 'Bad Request' }
      return
    end
    if status==401
      render status: 401, json: { status: 401, message: 'Unauthorized' }
      return
    end
    render plain: result[:token]
  end
end
