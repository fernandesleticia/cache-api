class Account < ApplicationRecord
    has_many :transactions

    validates_presence_of :number

    def self.transactions account_id, range_days
        @connection = ActiveRecord::Base.connection
        sql = "select * from transactions WHERE account_id = #{account_id} and date >= current_date - #{range_days}"
        records = @connection.exec_query(sql)
    end
end
