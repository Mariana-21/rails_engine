require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can see the api update an item" do
    id = create(:item).id
    previous_name = Item.last.name
    item_params = { name: "Naruto" }

    put "/api/v1/items/#{id}", params: {item: item_params}
    item = Item.find_by(id: id)

    expect(response).to be_successful 
    expect(item.name).to_not eq(previous_name)
    expect(item.name).to eq("Naruto")
  end
end