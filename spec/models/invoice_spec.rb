require 'rails_helper'

describe Invoice, type: :model do
  describe 'relationship' do
    it { should belong_to(:customer) } 
    it { should belong_to(:merchant) } 
  end
end
