require 'rails_helper'

describe InvoiceItem, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:unit_price) }
  end
  describe "relationships" do
    it { should belong_to(:invoice) } 
    it { should belong_to(:item) } 
  end  
end
