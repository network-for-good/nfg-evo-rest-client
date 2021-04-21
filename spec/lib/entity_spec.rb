# frozen_string_literal: true

require 'entity'

RSpec.describe NfgEvoRestClient::Entity do
  let(:entity_id) { 2 }

  describe '#find' do
    it 'returns the correct Entity' do
      results = VCR.use_cassette 'entity' do
        subject.find(entity_id)
      end

      expect(results.count).to be 1
      expect(results.first.identifier).to eq('admin')
    end
  end

  # TODO: need to fill in specs for the rest of the methods
  skip '#all'
  skip '#find'
end
