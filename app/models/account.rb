class Account < ApplicationRecord
    has_many :transactions

    validates_presence_of :number
end
