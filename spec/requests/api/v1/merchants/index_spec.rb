require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can see a list of all Merchants" do 
    create_list(:merchant, 10)

    get '/api/v1/merchants'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:data].length).to eq(10) 
  end
end