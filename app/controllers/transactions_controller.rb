class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :destroy]

  def index
    @transactions = Transaction.all
    render json: @transactions
  end

  def show
    render json: @transaction
  end

  def create
    @transaction = Transaction.create(transaction_params)
    render json: message(:create)
  end

  def update
    @transaction.update(transaction_params)
    render json: message(:update)
  end

  def destroy
    @transaction.destroy
    render json: message(:destroy)
  end

  def transactions_by_days
    @transactions = transactions_by_days
    render json: @transactions
  end

  private

  def message(action)
    if @transaction.errors.empty?
      { success: true, message: "Transaction #{action.capitalize}" }
    else
      { error: @transaction.errors, message: "Transaction Failed to #{action.capitalize}" }
    end
  end

  def transaction_params
    params.permit(:date, :description, :reference, :withdrawal, :deposit)
  end

  def set_transaction
    @transaction ||= Transaction.find(params[:id])
  end
end
