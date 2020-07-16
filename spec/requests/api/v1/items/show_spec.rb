require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can see an items show page" do 
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    json = JSON.parse(response.body, symbolize_names: true)
# binding.pry
    expect(response).to be_successful 
    expect(json[:id]).to eq(item.id) 
    expect(json[:name]).to eq(item.name) 
    expect(json[:description]).to eq(item.description) 
    expect(json[:unit_price]).to  eq(item.unit_price)  
    expect(json[:merchant_id]).to  eq(item.merchant_id)  
  end
  
end
