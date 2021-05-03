# frozen_string_literal: true

module NfgEvoRestClient
  # Provides access to FP's list of Campaigns, containing both Projects and Events
  class CampaignCollection < Base
    get :all, '/api/v1/campaigns', timeout: 60

    private

    def param_fields
      PARAM_FIELD_NAMES
    end

    PARAM_FIELD_NAMES = %i[entity_id search].freeze

    private_constant :PARAM_FIELD_NAMES
  end
end
