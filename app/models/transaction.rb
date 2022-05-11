class Transaction < ApplicationRecord
  validates_presence_of :account, :date, :description, :reference
  belongs_to :account, touch: true

  after_save :clear_cache

  EXPIRATION_TIME = 10.minute.to_i.freeze

  scope :for_account_in_range, ->(account_id, range_in_days) { where(account_id: account_id).where("date >= current_date - #{range_in_days}") }

  def transactions_by_days(account_id, range_in_days)
    key = "transactions" + "-" + account_id.to_s + "-" + range_in_days.to_s
    transactions = $redis.get(key)
    
    unless transactions
      transactions = self.for_account_in_range(account_id, range_in_days)
      cache(key, transactions)
    end

    transactions
  end

  def cache(key, transactions)
    $redis.set(key, transactions)
    $redis.expire(key, EXPIRATION_TIME)
  end

  def clear_cache
    clear
  end
end
