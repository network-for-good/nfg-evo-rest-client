module NfgEvoRestClient::Questionnaires
  class Response < ::NfgEvoRestClient::Base
    get :find, "/api/v1/questionnaires/responses/:id"

    private

    def param_fields
      []
    end
  end
end
