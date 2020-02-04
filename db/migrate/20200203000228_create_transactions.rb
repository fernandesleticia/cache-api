class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.date :date
      t.text :description
      t.integer :reference
      t.float :withdrawal
      t.float :deposit

      t.timestamps
    end
  end
end
