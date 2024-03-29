# frozen_string_literal: true

require 'project'

RSpec.describe NfgEvoRestClient::Project do
  let(:id) { 1403 }
  let(:entity_id) { 68 }
  let(:query_params) { { entity_id: entity_id } }

  subject do
    described_class.new(query_params)
  end

  describe '#all' do
    it 'returns all Projects for an Entity' do
      results = VCR.use_cassette 'all_projects' do
        subject.all
      end

      expect(results.size).to be > 1

      random_event = results.find { |r| r.name == 'Welcome New Neighbors in Houston!' }
      expect(random_event).not_to be_nil
    end

    context 'when search query parameter present' do
      let(:query_params) { { entity_id: entity_id, project_type: 'everyday' } }

      it 'returns searched Projects for an Entity' do
        results = VCR.use_cassette 'searched_projects' do
          subject.all
        end

        expect(results.size).to eq 2

        random_event = results.find { |r| r.name == 'Support Early Head Starts in Houston!' }
        expect(random_event).not_to be_nil
      end
    end
  end

  describe '#find' do
    it 'returns the correct Project' do
      result = VCR.use_cassette 'project' do
        subject.find(id)
      end

      expect(result[:name]).to eq('Support SUNNY FUTURES and Healthy Babies!')
      expect(result.public_url).to eq('https://neighborhoodcenters.networkforgood-beta.com/projects/1403-community-based-initiatives-support-sunny-futures-and-healthy-babies')
    end
  end
end
