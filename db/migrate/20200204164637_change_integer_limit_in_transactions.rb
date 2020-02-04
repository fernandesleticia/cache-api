class ChangeIntegerLimitInTransactions < ActiveRecord::Migration[6.0]
  def change
      change_column :transactions, :reference, :integer, limit: 8
  end
end
