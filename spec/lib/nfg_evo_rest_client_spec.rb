# frozen_string_literal: true

RSpec.describe NfgEvoRestClient do
  it 'defines a VERSION constant' do
    # This basically tests whether the gem can be properly loaded
    expect(NfgEvoRestClient::VERSION).to be_present
  end
end
