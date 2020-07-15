require 'rails_helper'

RSpec.describe "Merchant API" do 
  it "can create an api" do
    merchant_params = { name: "Apple" }

    post "/api/v1/merchants", params: merchant_params

    merchant = Merchant.last

    json = JSON.parse(response.body, symbolize_names: true)

    new_merchant = json[:data]
    expect(new_merchant[:attributes][:name]).to eq(merchant.name)
  end
end