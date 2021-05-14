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

    before_request do |_name, request|
      # HACK: I could not get the append_param_fields_if_any method in the Base
      # class to work w/ entity_id. The following code does work. I would
      # like to revisit in a future refactoring pass.
      request.get_params[:entity_id] = request.object.entity_id
    end
  end
end
