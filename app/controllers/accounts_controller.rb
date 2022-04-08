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
    render json: @account, :created
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
