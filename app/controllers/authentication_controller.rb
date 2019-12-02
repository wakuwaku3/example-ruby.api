class AuthenticationController < ApplicationController
  skip_before_action :require_sign_in, only: [:sign_up, :sign_in]
  
  def sign_up
    json_request = JSON.parse(request.body.read)
    result,state = authentication_usecase.sign_up({
      name:json_request['name'],
      password:json_request['password'],
      email:json_request['email'],
    })
    if !state
      return render status: 400, json: { status: 400, message: 'Bad Request' }
    end
    render plain: result[:token]
  end
  
  def sign_in
    json_request = JSON.parse(request.body.read)
    result,status = authentication_usecase.sign_in({
      email:json_request['email'],
      password:json_request['password'],
    })
    if status==400
      return render status: 400, json: { status: 400, message: 'Bad Request' }
    end
    if status==401
      return  render status: 401, json: { status: 401, message: 'Unauthorized' }
    end
    render plain: result[:token]
  end
end
