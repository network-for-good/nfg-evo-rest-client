# frozen_string_literal: true

require 'event'

RSpec.describe NfgEvoRestClient::Event do
  let(:event_id)  { 2 } # TODO: these values are local to my dev environment, need to change to beta values to allow re-recording
  let(:entity_id) { 2 } # once we do that, we can re-record VCR cassettes with live beta data

  subject do
    described_class.new(entity_id: entity_id)
  end

  describe '#all 'do
    it 'returns all Events for an Entity' do
      results = VCR.use_cassette 'all_events' do
        subject.all
      end

      expect(results.size).to eq(1)
      skip 'add more assertions when beta data available'
    end
  end

  describe '#find' do
    it 'returns the correct Event' do
      results = VCR.use_cassette 'event' do
        subject.find(event_id)
      end

      expect(results[:name]).to eq('Spring Gala')
      skip 'add more assertions when beta data available'
    end
  end
end
