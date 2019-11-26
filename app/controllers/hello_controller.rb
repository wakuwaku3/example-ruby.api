# frozen_string_literal: true

class HelloController < ApplicationController
  def index
    render plain: 'Hello, World!!'
  end
end
