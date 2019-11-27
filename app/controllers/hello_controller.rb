class HelloController < ApplicationController
  def index
    render plain: "Hello, World #{user.name}!!"
  end
end
