require 'rails_helper'

RSpec.describe "Merchant API" do
  it "can update a merchant" do
    id = create(:merchant).id
    previous_name = Merchant.last.name
    merchant_params = { name: "Sasuke"}

    put "/api/v1/merchants/#{id}", params: merchant_params

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes][:name]).to eq("Sasuke")
    expect(json[:data][:attributes][:name]).to_not eq("#{previous_name}")  
  end
end 