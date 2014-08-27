TprLebanon::Application.routes.draw do

  resources :students

  resources :leads

  root :to => 'home#index'

  get 'home/index'
  put 'home/contact'
  get 'home/contact'
  put 'home/thanks'
  get 'home/thanks'
  put 'home/soon'
  get 'home/soon'
  get '/sat/index' => 'courses#sat'
  get '/sat/test' => 'courses#test'

end
