class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :update, :destroy]

  def index
    @accounts = Account.all
    render json: @accounts
  end

  def show
    render json: @account
  end

  def create
    @account = Account.create(account_params)
    render json: message(:create)
  end

  def update
    @account.update(account_params)
    render json: message(:update)
  end

  def destroy
    @account.destroy
    render json: message(:destroy)
  end

  private

  def message(action)
    if @account.errors.empty?
      { success: true, message: "Account #{action.capitalize}" }
    else
      { error: @account.errors, message: "Account Failed to #{action.capitalize}" }
    end
  end

  def account_params
    params.permit(:number, :created_by)
  end

  def set_account
    @account ||= Account.find(params[:id])
  end
end
