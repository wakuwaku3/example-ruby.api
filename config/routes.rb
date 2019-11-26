# frozen_string_literal: true

Rails.application.routes.draw do
  get '' => 'root#index'
  get 'hello' => 'hello#index'
end
