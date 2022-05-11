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

  describe 'constants' do
    it "should have the EXPIRATION_TIME constant set" do
      expect(described_class.const_defined?(EXPIRATION_TIME)).to be_truthy
    end
  end

  describe 'scopes' do
    describe '.for_account_in_range' do
      subject { described_class.for_account_in_range(account.id, range_in_days) }
      
      let(:account) { create(:account) }
      let(:another_account) { create(:account) }
      let(:range_in_days) { 3 }
      let!(:transaction_1) { create(:transaction, account: account, date: 1.day.ago) }
      let!(:transaction_2) { create(:transaction, account: account, date: 2.days.ago) }
      let!(:transaction_3) { create(:transaction, account: account, date: 3.days.ago) }
      let!(:transaction_4) { create(:transaction, account: account, date: 4.days.ago) }
      let!(:transaction_5) { create(:transaction, account: another_account, date: 1.day.ago) }
      let(:expected_transactions) { [transaction_1, transaction_2, transaction_3] }
      
      it { is_expected.to eq(expected_transactions) }
    end
  end

  describe '#transactions_by_days' do
    subject { described_class.new().transactions_by_days(account.id, range_in_days) }

    context 'when there are transactions associated with the account' do
      let(:account) { create(:account) }
      let(:another_account) { create(:account) }
      let(:range_in_days) { 3 }
      let!(:transaction_1) { create(:transaction, account: account, date: 1.day.ago) }
      let!(:transaction_2) { create(:transaction, account: account, date: 2.days.ago) }
      let!(:transaction_3) { create(:transaction, account: account, date: 3.days.ago) }
      let!(:transaction_4) { create(:transaction, account: account, date: 4.days.ago) }
      let!(:transaction_5) { create(:transaction, account: another_account, date: 1.day.ago) }
      let(:expected_transactions) { [transaction_1, transaction_2, transaction_3] }
      
      it { is_expected.to eq(expected_transactions) }
    end
  end
end
