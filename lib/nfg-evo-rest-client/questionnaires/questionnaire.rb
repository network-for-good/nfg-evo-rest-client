module NfgEvoRestClient::Questionnaires
  class Questionnaire < ::NfgEvoRestClient::Base
    post :refresh_cache, "/api/v1/questionnaires/refresh_cache"

    private

    def param_fields
      []
    end
  end
end
