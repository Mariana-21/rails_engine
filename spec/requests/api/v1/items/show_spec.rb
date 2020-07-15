require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can see an items show page" do 
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_successful 
    expect(item["id"]).to eq(id) 
  end
  
end
