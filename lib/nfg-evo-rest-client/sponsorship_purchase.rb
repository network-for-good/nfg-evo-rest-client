# frozen_string_literal: true

module NfgEvoRestClient
  class SponsorshipPurchase < Base
    get :all, '/api/v1/sponsorship_purchases'
    get :find, '/api/v1/sponsorship_purchases/:id'

    def param_fields
      PARAM_FIELDS
    end

    PARAM_FIELDS = [:entity_id, :from_date_time, :to_date_time].freeze
  end
end
