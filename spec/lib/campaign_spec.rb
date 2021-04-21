# frozen_string_literal: true

require 'campaign'

RSpec.describe NfgEvoRestClient::Campaign do
  let(:entity_id) { 2 }
  let(:search_params) { {} }

  let(:params) do
    { id: entity_id,
      search: search_params }
  end

  subject do
    NfgEvoRestClient::Campaign.new(params)
  end

  describe '#all' do
    it 'calls the EVO/FP Campaigns API' do
      results = VCR.use_cassette 'campaigns' do
        subject.all
      end

      expect(results[:events]).to be_present
      expect(results[:events].count).to be > 0

      expect(results[:projects]).to be_present
      expect(results[:projects].count).to be > 0
    end

    context 'with the :limit parameter' do
      subject do
        described_class.new(params.merge(limit: 5))
      end

      it 'returns a limited results set' do
        results = VCR.use_cassette 'campaigns_limited' do
          subject.all
        end

        expect(results[:events].count).to be 5
        expect(results[:projects].count).to be 5
      end
    end

    context 'with the :text_to_give_allowed parameter' do
      let(:search_params) do
        { text_to_give_allowed: true }
      end

      it 'returns only text-to-give eligible campaigns' do
        results = VCR.use_cassette 'campaigns_text_to_give' do
          subject.all
        end

        projects = results[:projects]
        events = results[:events]

        expect(projects.size).to be 2
        expect(events.size).to be 9

        expect(projects.map { |p| p[:project_type] }.uniq).to eq(['everyday'])
        expect(results[:events].map { |e| e['status'] }.uniq).to eq(['accepted'])
      end
    end
  end
end
