class ChangeIntegerLimitInAccount < ActiveRecord::Migration[6.0]
  def change
    change_column :accounts, :number, :integer, limit: 8
  end
end
