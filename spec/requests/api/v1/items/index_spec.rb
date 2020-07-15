require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can see all items" do
    create_list(:item, 8)

    get '/api/v1/items'

    expect(response).to be_successful 

    items = JSON.parse(response.body)

    expect(items.count).to eq(8) 
  end
end
