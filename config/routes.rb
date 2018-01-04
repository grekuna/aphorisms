Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'aphorisms#start'

get 'aphorisms', to: 'aphorisms#index'

get 'start', to: 'aphorisms#start'

get 'calvin', to: 'calvin#index'

end
