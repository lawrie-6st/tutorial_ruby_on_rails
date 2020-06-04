# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # エンドポイントに対して、どのcontrollerを割り当てるかを指定できる。
  get '/who_is_wataru' => 'who_is_wataru#self_introduce'
  # ${URL}/の時に何を見せるかのデフォルトコントローラーを選択できる。
  root 'who_is_wataru#self_introduce'
end
