# frozen_string_literal: true

module NfgEvoRestClient
  # Allows you to retrieve project information. You can limit which entity
  # you want to retrieve data for by setting the entity_id on the instance of
  # the Project object.You can also adjust the begin and end dates in the same way.
  # @example
  #   NfgEvoRestClient::Project.new(entity_id: 999)
  # @example
  #   NfgEvoRestClient::Project.new(entity_id: 244, project_type: 'everyday')
  class Project < Base
    get :all, '/api/v1/projects', timeout: 60
    get :find, '/api/v1/projects/:id'

    private

    def param_fields
      PARAM_FIELDS
    end

    PARAM_FIELDS = %i[entity_id search].freeze

    private_constant PARAM_FIELDS
  end
end
