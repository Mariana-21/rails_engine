require 'rails_helper'

RSpec.describe "Multi Search Request" do
  it "can find a list of items that contain a fragment, case insensitive" do
    item1 = create(:item, name: "Naruto")
    item2 = create(:item, name: "Naruto Shippuden")
    item3 = create(:item, name: "Cowboy Bepbob")

    get "/api/v1/items/find_all?name=naruto"
    json = JSON.parse(response.body, symbolize_names: true)
    # binding.pry

    expect(json[:data].length).to eq(2)
    expect(json[:data].first[:type]).to eq("item")
    expect(json[:data].first[:attributes][:name]).to eq(item1.name)
    expect(json[:data].first[:attributes][:description]).to eq(item1.description)
    expect(json[:data].first[:name]).to_not eq(item2.name)
  end
end