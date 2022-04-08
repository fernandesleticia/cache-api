class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :destroy]

  def index
    @transactions = Transaction.all
    render json: @transactions
  end

  def create
    @transaction = Transaction.create(transaction_params)
    render json: @transaction
  end

  def show
    render json: @transaction
  end

  def update
    @transaction.update(transaction_params)
    head :no_content
  end

  def destroy
    @transaction.destroy
    head :no_content
  end

  def transactions_by_days
    @transactions = transactions_by_days
    render json: @transactions
  end

  private

  def transaction_params
    params.permit(:date, :description, :reference, :withdrawal, :deposit)
  end

  def set_transaction
    @transaction ||= Transaction.find(params[:id])
  end
end
