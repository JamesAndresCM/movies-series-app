require 'rails_helper'

RSpec.describe Type, type: :model do
  
  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive  }
  end

  describe "associations" do
    it { should have_many(:series).dependent(:destroy) }
  end

  it "capitalize callback" do
    type = FactoryBot.create(:type, name: "type") 
    expect(type.name).to eq "Type"
  end

end
