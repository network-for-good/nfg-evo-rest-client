# frozen_string_literal: true

module NfgEvoRestClient
  # Allows you to retrieve Event information. You can limit which entity
  # you want to retrieve data for by setting the entity_id on the instance of
  # the Event object.
  # @example
  #   NfgEvoRestClient::Event.new(entity_id: 999)
  class Event < Base
    get :all, '/api/v1/events', timeout: 60
    get :find, '/api/v1/events/:id'

    private

    def param_fields
      PARAM_FIELDS
    end

    PARAM_FIELDS = %i[entity_id].freeze

    private_constant :PARAM_FIELDS
  end
end
