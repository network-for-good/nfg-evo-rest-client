# frozen_string_literal: true

require 'event'

RSpec.describe NfgEvoRestClient::Event do
  let(:event_id)  { 116 } # TODO: these values correspond to beta records current as of 5/4/2021
  let(:entity_id) { 428 }

  before do
    NfgEvoRestClient.nfg_evo_rest_bearer_token = 'Bearer dummy_token'
  end
 
  after do
    NfgEvoRestClient.nfg_evo_rest_bearer_token = ENV.fetch('NFG_BEARER_TOKEN', nil)
  end

  subject do
    described_class.new(entity_id: entity_id)
  end

  describe '#all' do
    it 'returns all Events for an Entity' do
      results = VCR.use_cassette 'all_events' do
        subject.all
      end

      expect(results.size).to be > 1

      random_event = results.find { |r| r.name == 'Liisa Celebrates PSTWO-9215' }
      expect(random_event).not_to be_nil
    end
  end

  describe '#find' do
    it 'returns the correct Event' do
      result = VCR.use_cassette 'event' do
        subject.find(event_id)
      end

      expect(result[:name]).to eq('My Fine Event')
      expect(result.public_url).to eq('https://spin.networkforgood-beta.com/events/116-my-fine-event')
    end
  end
end
