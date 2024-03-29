# frozen_string_literal: true

module NfgEvoRestClient::Questionnaires
  class Questionnaire < ::NfgEvoRestClient::Base
    post :refresh_cache, "/api/v1/questionnaires/refresh_cache"

    def param_fields
      []
    end
  end
end
