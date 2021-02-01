Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :hybrids do
    resources :friends
    resources :motorhomes
    resources :places
  end
  # will nest these routes later
end
