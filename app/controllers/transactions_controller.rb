class TransactionsController < ApplicationController
    before_action :set_transaction, only: [:show, :update, :destroy]

    # GET /transactions
    def index
        @transactions = fetch_transactions
        json_response(@transactions)
    end

    # GET /transaction/get_3_days
    def get_3_days
        @transactions = fetch_transactions_3_days
        json_response(@transactions)
    end

    # GET /transaction/get_15_days
    def get_15_days
        @transactions = fetch_transactions_15_days
        json_response(@transactions)
    end

    # GET /transaction/get_30_days
    def get_30_days
        @transactions = fetch_transactions_30_days
        json_response(@transactions)
    end

    # POST /transactions
    def create
        @transaction = Transaction.create!(transaction_params)
        json_response(@transaction, :created)
    end

    # GET /transactions/:id
    def show
        json_response(@transaction)
    end

    # PUT /transactions/:id
    def update
        @transaction.update(transaction_params)
        head :no_content
    end

    # DELETE /transactions/:id
    def destroy
        @transaction.destroy
        head :no_content
    end

    private

    def transaction_params
        # whitelist params
        params.permit(:title, :created_by)
    end

    def set_transaction
        @transaction = Transaction.find(params[:id])
    end
end
