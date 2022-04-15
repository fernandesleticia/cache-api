require "rails_helper"

describe Transaction do
  # Validation tests
  # ensure columns date, description and reference are present before saving
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:reference) }
end
