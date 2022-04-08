class Account < ApplicationRecord
  validates_presence_of :number
  
  has_many :transactions
end
