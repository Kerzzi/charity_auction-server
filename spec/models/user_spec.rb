RSpec.describe User do
  ["name", "mobile_phone_number", "email_address", "physical_address"].each do |required_attribute|
    it { is_expected.to have_attribute required_attribute }

    it { is_expected.to validate_presence_of required_attribute }
  end

  ["mobile_phone_number", "email_address"].each do |unique_attribute|
    it "validates uniqueness of #{unique_attribute}" do
      subject = FactoryGirl.create(:user)
    end
  end

  describe "relationships" do
    it { is_expected.to have_many :auction_admins }
    it { is_expected.to have_many :donations }
    it { is_expected.to have_many :memberships }
  end

  it "persists a password digest based on the password that can be used for authentication" do
    password = "password"
    subject = FactoryGirl.create(:user, password: password)
    expect(subject.authenticate(password)).to eq subject
  end
end
