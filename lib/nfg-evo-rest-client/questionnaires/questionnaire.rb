module NfgEvoRestClient::Questionnaires
  class Questionnaire < ::NfgEvoRestClient::Base
    base_url SsoOpenid::Urls.evo.fqdn

    verbose true

    before_request do |name, request|
      request.get_params[:user_email] = nfg_evo_rest_user_email
      request.get_params[:user_token] = nfg_evo_rest_user_token
      append_param_fields_if_any(request)
    end

    post :refresh_cache, "/api/v1/questionnaires/refresh_cache"

    private

    def param_fields
      []
    end
  end
end
