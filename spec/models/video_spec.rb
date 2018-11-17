require 'rails_helper'

RSpec.describe Video, type: :model do
  
  it "has a valid factory" do
    expect(FactoryBot.build(:video)).to be_valid
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of(:video).on(:create) }
  end

  describe "Associations" do
    it { should belong_to(:series) }
  end

end
