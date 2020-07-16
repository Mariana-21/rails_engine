require 'rails_helper'

RSpec.describe "Multi Search Request" do
  it "can find a list of items that contain a fragment, case insensitive" do
    merchant1 = create(:merchant, name: "Toys R Us")
    merchant2 = create(:merchant, name: "Toyota Dealership")

    get "/api/v1/merchants/find_all?name=toy"
    json = JSON.parse(response.body, symbolize_names: true)
    # binding.pry

    expect(json[:data].length).to eq(2)
    expect(json[:data].first[:type]).to eq("merchant")
    expect(json[:data].first[:attributes][:name]).to eq(merchant1.name)
    expect(json[:data].last[:type]).to eq("merchant")
    expect(json[:data].last[:attributes][:name]).to eq(merchant2.name)
  end
end