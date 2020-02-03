class TransactionsController < ApplicationController
    before_action :set_transaction, only: [:show, :update, :destroy]

    # GET /transactions
    def index
        @transactions = Transaction.all
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
