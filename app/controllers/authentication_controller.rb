class AuthenticationController < ApplicationController
  def initialize(options={})
    @authentication_usecase = options[:authentication_usecase] || AuthenticationUsecase.new
  end
  
  def sign_up
    json_request = JSON.parse(request.body.read)
    result,state = @authentication_usecase.sign_up({name:json_request['name'],password:json_request['password']})
    if !state
      render status: 400, json: { status: 400, message: 'Bad Request' }
      return
    end
    render plain: result[:token]
  end
end
