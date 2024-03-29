# frozen_string_literal: true

module NfgEvoRestClient
  class TicketPurchase < Base
    get :all, "/api/v1/ticket_purchases"
    get :find, "/api/v1/ticket_purchases/:id"

    def param_fields
      PARAM_FIELDS
    end

    PARAM_FIELDS = [{ entity_id: 0 }, :from_date_time, :to_date_time].freeze
  end
end
