class Transaction < ApplicationRecord
    # validations
    validates_presence_of :date, :description, :reference 
    belongs_to :account, touch: true

    after_save :clear_cache

    def clear_cache
        clear
    end

    def self.get_3_day_statement
        @connection = ActiveRecord::Base.connection
        sql = "select * from transactions WHERE date >= current_date - 3"
        records = @connection.exec_query(sql)
    end

    def self.get_15_day_statement
        @connection = ActiveRecord::Base.connection
        sql = "select * from transactions where date >= current_date - 15"
        records = @connection.exec_query(sql)
    end

    def self.get_30_day_statement
        @connection = ActiveRecord::Base.connection
        sql = "select * from transactions where date >= current_date - 30"
        records = @connection.exec_query(sql)
    end
end
