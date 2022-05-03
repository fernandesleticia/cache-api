require "rails_helper"

describe Transaction do
  describe 'validations' do
    it { should validate_presence_of(:account) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:reference) }
  end

  describe 'associations' do
    it { is_expected.to belong_to :account }
  end

  describe '#transactions_by_days' do
    subject { described_class.new().transactions_by_days(account_id, range_in_days) }

    context 'when there are transactions associated with the account' do
      let(:account_id) { 1 }
      let(:range_in_days) { 20 }
      let(:transactions) { [] }
      it { is_expected.to eq(transactions) }
    end
  end
end
