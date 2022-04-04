class Account < ApplicationRecord
  validates_presence_of :number
  
  has_many :transactions

  def self.transactions account_id, range_days
    sql = "select * from transactions WHERE account_id = #{account_id} and date >= current_date - #{range_days}"
    records = connection.exec_query(sql)
  end

  def connection
    @connection ||= ActiveRecord::Base.connection
  end
end
