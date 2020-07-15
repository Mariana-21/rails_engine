require 'rails_helper'

RSpec.describe "Merchant API" do
  it "can show a merchant" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:data][:attributes][:id]).to eq(merchant.id)
    expect(json[:data][:attributes][:name]).to eq(merchant.name) 
  end
end