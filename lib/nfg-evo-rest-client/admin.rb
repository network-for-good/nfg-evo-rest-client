# frozen_string_literal: true

module NfgEvoRestClient
  class Admin < Base
    post :create, '/api/v1/admins', timeout: 60
    put :update, '/api/v1/admins/:id', timeout: 60
    delete :remove, 'api/v1/admins/:id', timeout: 60

    def param_fields
      [:entity_id]
    end
  end
end
