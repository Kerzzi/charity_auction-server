RSpec.describe BidType do
  describe "attributes" do
    it { is_expected.to have_attribute :name }
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :name }
  end

  describe "relationships" do
    it { is_expected.to have_many :donations }
  end
end
