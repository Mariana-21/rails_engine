require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can see all items" do
    items = create_list(:item, 8)

    get '/api/v1/items'

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful 
# binding.pry
    expect(json.length).to eq(8)
    expect(json.first[:name]).to eq(items.first[:name])
  end
end
