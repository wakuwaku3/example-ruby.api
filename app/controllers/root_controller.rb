class RootController < ApplicationController
  skip_before_action :require_sign_in, only: [:index]

  def index
    render plain: 'Hello, World!'
  end
end
