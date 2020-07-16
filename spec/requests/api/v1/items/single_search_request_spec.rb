require 'rails_helper'

RSpec.describe "Item Search" do 
  it "can find an item the meets the criteria given" do
    item1 = create(:item, name: "Toy Story")

    get '/api/v1/items/find?name=toy'
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:data][:type]).to eq('item') 
    expect(json[:data][:attributes][:name].downcase).to include('story')     
    expect(json[:data][:id]).to eq(item1.id.to_s) 
  end
end