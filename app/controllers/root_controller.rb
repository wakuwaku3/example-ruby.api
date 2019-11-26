# frozen_string_literal: true

class RootController < ApplicationController
  def index
    render plain: 'Hello, World!'
  end
end
