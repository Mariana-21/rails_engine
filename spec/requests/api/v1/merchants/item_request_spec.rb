require 'rails_helper'

RSpec.describe "Item-Merchant Relationship" do
  it "can get a list of a merchants items" do
    merchant = create(:merchant)

    10.times do
      create(:item, merchant: merchant)
    end 

    get "/api/v1/merchants/#{merchant.id}/items"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:data].length).to eq(10)  
    expect(json[:data].last[:type]).to eq("item") 
  end
end