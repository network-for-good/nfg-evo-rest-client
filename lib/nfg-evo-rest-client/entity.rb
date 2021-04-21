# frozen_string_literal: true

module NfgEvoRestClient
  class Entity < Base
    get :all, '/api/v1/entities'
    get :find, '/api/v1/entities/:id'

    post :deactivate, '/api/v1/entities/:id/deactivate', timeout: 60

    private

    def param_fields
      []
    end
  end
end
