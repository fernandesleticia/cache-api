require 'rails_helper'

describe Account do
  describe 'associations' do
    it { is_expected.to have_many :transactions }
  end

  describe 'validations' do
    it { should validate_presence_of(:number) }
  end
end
