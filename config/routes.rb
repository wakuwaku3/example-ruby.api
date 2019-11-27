# frozen_string_literal: true

Rails.application.routes.draw do
  get '' => 'root#index'
  get 'hello' => 'hello#index'
  post 'authentication/sign-up'=>'authentication#sign_up'
  post 'authentication/sign-in'=>'authentication#sign_in'
end
