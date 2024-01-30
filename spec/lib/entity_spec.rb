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

    # the following spec could be applied to all of the API calls
    # but it's not necessary to test every single one. This is just
    # an example of how to test that the authorization header is
    # being added to the request. And that the request does not
    # include the user_email and user_token params.
    context 'when nfg_evo_rest_bearer_token is set' do
      before do
        allow(NfgEvoRestClient).to receive(:nfg_evo_rest_bearer_token).and_return('token123')
      end

      it 'adds an authorization header to the request' do
        # here, we're using the VCR cassette to ensure that the request
        # is made with the authorization header. If the header is not
        # present, the cassette will not match and the test will fail.
        # The failure will simply be that VCR could not find a matching cassette.
        results = VCR.use_cassette 'entity_with_authorization_header', match_requests_on: %i[method uri headers] do
          subject.find(entity_id)
        end

        expect(results.count).to be 1
      end
    end
  end

  # TODO: need to fill in specs for the rest of the methods
  skip '#all'
  skip '#find'
end
