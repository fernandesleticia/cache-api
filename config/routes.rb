Rails.application.routes.draw do
  resources :transactions
  
  resources :accounts
  get '/accounts/:id/transactions/:range_days', to: 'accounts#get_transactions'
end
