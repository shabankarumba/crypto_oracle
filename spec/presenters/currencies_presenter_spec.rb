# frozen_string_literal: true

require './lib/presenters/currencies_presenter'
require './spec/spec_helper'

RSpec.describe CurrenciesPresenter do
  subject(:present) { described_class.new(api_response).as_json }
  let(:api_response) do
    File.read('spec/fixtures/currencies_api_response.json')
  end
  let(:expected_response) do
    [
      {
        name: 'Bitcoin',
        symbol: 'BTC',
        price: '48135.84174593',
        circulating_supply: '18831712',
        max_supply: '21000000'
      },
      {
        name: 'Ethereum',
        symbol: 'ETH',
        price: '3281.22963113',
        circulating_supply: '117753964',
        max_supply: nil
      },
      {
        name: 'XRP',
        symbol: 'XRP',
        price: '1.02691563',
        circulating_supply: '46750439262',
        max_supply: '100000000000'
      }
    ]
  end
  describe '#present' do
    it 'outputs the response' do
      expect(present).to eq(expected_response.to_json)
    end
  end
end
