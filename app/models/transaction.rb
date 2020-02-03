class Transaction < ApplicationRecord
    # validations
    validates_presence_of :date, :description, :reference 
end
