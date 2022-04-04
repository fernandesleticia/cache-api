class Transaction < ApplicationRecord
  validates_presence_of :date, :description, :reference, :account
  belongs_to :account, touch: true

  after_save :clear_cache

  def clear_cache
    clear
  end
end
