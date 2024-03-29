# frozen_string_literal: true

module NfgEvoRestClient::Questionnaires
  class Response < ::NfgEvoRestClient::Base
    get :find, "/api/v1/questionnaires/responses/:id"

    def param_fields
      []
    end
  end
end
