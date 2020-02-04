Rails.application.routes.draw do
  resources :transactions

  get '/transaction/get_3_days', to: 'transactions#get_3_days'
  get '/transaction/get_15_days', to: 'transactions#get_15_days'
  get '/transaction/get_30_days', to: 'transactions#get_30_days'
end
