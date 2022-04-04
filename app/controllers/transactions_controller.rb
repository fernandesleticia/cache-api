class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :destroy]

  def index
    @transactions = fetch_transactions
    json_response(@transactions)
  end

  def create
    @transaction = Transaction.create(transaction_params)
    json_response(@transaction, :created)
  end

  def show
    json_response(@transaction)
  end

  def update
    @transaction.update(transaction_params)
    head :no_content
  end

  def destroy
    @transaction.destroy
    head :no_content
  end

  private

  def transaction_params
    params.permit(:date, :description, :reference, :withdrawal, :deposit)
  end

  def set_transaction
    @transaction ||= Transaction.find(params[:id])
  end
end
