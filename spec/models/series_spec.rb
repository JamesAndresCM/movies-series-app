require 'rails_helper'

RSpec.describe Series, type: :model do
  
  it "has a valid factory" do
    expect(FactoryBot.create(:series)).to be_valid
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :release_date }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :name }
  end
  
  describe "Associations" do
    it { should have_many(:videos).dependent(:destroy) }
    it { should have_many(:tags).dependent(:destroy) }
    it { should belong_to(:category) }
    it { should belong_to(:type) }
  end

  describe "Nested attributes" do
    it { should accept_nested_attributes_for(:videos).allow_destroy(true) }
    it { should accept_nested_attributes_for(:tags).allow_destroy(true) }
  end

  describe "returns by type (letter, name)" do
    let(:type1) { FactoryBot.create(:type, name: "Movie") }
    let(:type2) { FactoryBot.create(:type, name: "Serie") }
    let(:category) { FactoryBot.create(:category, name: "SCI") }
    let(:category2) { FactoryBot.create(:category, name: "Drama") }
    let(:category3) { FactoryBot.create(:category, name: "Terror") }
    let(:serie1) { FactoryBot.create(:series, name: "Akira", category_id: category.id, type_id: type1.id) }
    let(:serie2) { FactoryBot.create(:series, name: "Animatrix", category_id: category2.id, type_id: type1.id) }
    let(:serie3) { FactoryBot.create(:series, name: "Thor", category_id: category2.id, type_id: type1.id) }

    context "when type is a letter" do
      it "returns letter" do
        expect(Series.type_attr_serie("letter", "A")).to include(serie1, serie2)
      end
    end

    context "when type is a name" do
      it "returns name" do
        expect(Series.type_attr_serie("name", "Thor")).to include(serie3)
      end
    end
  end
end
