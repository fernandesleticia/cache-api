Rails.application.routes.draw do
  resources :transactions
  resources :accounts

  get 'transactions/:account_id/:range_in_days', to: 'transactions#transactions_by_days'
end
