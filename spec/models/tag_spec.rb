require 'rails_helper'

RSpec.describe Tag, type: :model do

  it "has a valid factory" do
    expect(FactoryBot.build(:tag)).to be_valid
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :name }
  end
  describe "Associations" do
    it { should belong_to(:series) }
  end

  it "returns tag string" do
    type = FactoryBot.create(:type)
    serie = FactoryBot.create(:series,type_id: type.id)
    tag = FactoryBot.build(:tag, series_id: serie.id, name: "test")
    expect(tag.tag_string).to eq "#Test"
  end
end
