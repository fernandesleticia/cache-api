class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :update, :destroy]

  def index
    @accounts = Account.all
    json_response(@accounts)
  end

  def get_transactions
    @transactions = fetch_transactions(params[:id], params[:range_days])
    json_response(@transactions)
  end

  def create
    @account = Account.create(account_params)
    json_response(@account, :created)
  end

  def show
    json_response(@account)
  end

  def update
    @account.update(account_params)
    head :no_content
  end

  def destroy
    @account.destroy
    head :no_content
  end

  private

  def account_params
    params.permit(:number, :created_by)
  end

  def set_account
    @account ||= Account.find(params[:id])
  end
end
