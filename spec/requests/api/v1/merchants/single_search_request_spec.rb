require 'rails_helper'

RSpec.describe "Merchant single search" do 
  it 'can find an item the meets the criteria given' do
    merchant1 = create(:merchant, name: 'Viz Media')
    merchant2 = create(:merchant, name: 'ShonenJump')

    get '/api/v1/merchants/find?name=Jump'
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:data][:type]).to eq('merchant') 
    expect(json[:data][:attributes][:name]).to eq(merchant2.name)     
    expect(json[:data][:attributes][:name]).to_not eq(merchant1.name)     
    expect(json[:data][:id]).to eq(merchant2.id.to_s) 
  end
end