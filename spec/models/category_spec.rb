require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:category)).to be_valid
  end

  it "valid with a name" do
    category = Category.new(name: "Test Category")
    expect(category).to be_valid
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive  }
  end

  describe "Associations" do
    it { should have_many(:series).dependent(:destroy) }
  end

  describe "capitalize and slug category" do
    let(:category) { FactoryBot.create(:category, name: "test category") }
    context "when slug category" do
      it "returns a friendly_id category" do
        expect(category.slug).to eq "test-category"
      end
    end

    context "when capitalize category" do
      it "returns capitalize category" do
        expect(category.name).to eq "Test category"
      end
    end
  end
end
