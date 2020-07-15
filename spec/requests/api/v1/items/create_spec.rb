require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "I can see the api" do
    it "create a new item" do
      merchant = create(:merchant)
      item_params = { name: "Naruto", description: "I'm going to be Hokage someday! Believe it!", merchant_id: "#{merchant.id}", unit_price: 25.05}

      post "/api/v1/items", params: {item: item_params}
      item = Item.last

      expect(response).to be_successful 
      expect(item.name).to eq(item_params[:name]) 
    end
  end
end