# frozen_string_literal: true

require 'event'

RSpec.describe NfgEvoRestClient::Project do
  let(:id)  { 1406 } 
  let(:entity_id) { 68 }

  subject do
    described_class.new(entity_id: entity_id)
  end

  describe '#all' do
    it 'returns all Projects for an Entity' do
      results = VCR.use_cassette 'all_projects', :record => :new_episodes do
        subject.all
      end

      expect(results.size).to be > 1

      random_event = results.find { |r| r.id == 1403 }
      expect(random_event).not_to be_nil
    end

    context "when searched by project type" do
      
      it 'returns all Projects matching the search term for an Entity' do
        results = VCR.use_cassette 'searched_projects', :record => :new_episodes do
          described_class.new(entity_id: entity_id, project_type: 'everyday').all
        end

        expect(results.size).to be > 1
  
        random_event = results.find { |r| r.name == 'Support Early Head Starts in Houston!' }
        expect(random_event).not_to be_nil
      end
    end
  end

  describe '#find' do
    it 'returns the correct Project' do
      result = VCR.use_cassette 'project', :record => :new_episodes do
        subject.find(id)
      end

      expect(result[:name]).to eq('Welcome New Neighbors in Houston!')
      expect(result.public_url).to eq('https://neighborhoodcenters.networkforgood-beta.com/projects/1406-immigration-citizenship-assistance-welcome-new-neighbors-in-houston')
    end
  end
end
