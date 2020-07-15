require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can see the api destroy an item" do
    item = create(:item)

    expect(Item.count).to eq(1) 

    delete "/api/v1/items/#{item.id}"

    expect(response).to be_successful 
    expect(Item.count).to eq(0) 
  end
end