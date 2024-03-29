# frozen_string_literal: true

require 'project'

RSpec.describe NfgEvoRestClient::TicketPurchase do
  let(:id) { 7049 }
  let(:entity_id) { 501 }
  let(:query_params) { { entity_id: entity_id, from_date_time: '2017-09-26 17:00:00', to_date_time: '2017-09-26 18:00:00'} }

  subject do
    described_class.new(query_params)
  end

  describe '#all' do
    it 'returns all TicketPurchase for an Entity' do
      results = VCR.use_cassette 'all_ticket_purchases' do
        subject.all
      end

      expect(results.size).to eq 2

      random_event = results.find { |r| r.id == 7048 }
      expect(random_event).not_to be_nil
    end
  end

  describe '#find' do
    it 'returns the correct TicketPurchase' do
      result = VCR.use_cassette 'ticket_purchase' do
        subject.find(id)
      end
      expect(result.items.first[:id]).to eq(7049)
    end
  end
end
