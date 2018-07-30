require 'rails_helper'

describe Sku, type: :model do
 
  describe 'validation' do
    context "Sku Denomination, Sku comination" do
      let(:sku) { FactoryGirl.build(:sku) }
      it "When invalid denomination format" do
        sku.sku_denomination = ''
        expect(sku).not_to be_valid 
      end

      it "When invalid combination format" do
        sku.sku_combination = ''
        expect(sku).not_to be_valid 
      end

      it "When user is blank but combination present" do
        sku.sku_combination = '3333333,333389'
        expect(sku).not_to be_valid 
      end 
    end
  end
end
