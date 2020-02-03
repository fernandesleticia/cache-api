require 'rails_helper'

RSpec.describe Transaction, type: :model do
  # Validation tests
  # ensure columns date, description and reference are present before saving
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:reference) }
end
