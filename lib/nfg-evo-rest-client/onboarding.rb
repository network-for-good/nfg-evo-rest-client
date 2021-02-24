module NfgEvoRestClient
  class Onboarding < Base
    # can't get the value set in the initializer to populate
    # the base_url as the class is being loaded before the initializer
    # is run.
    base_url SsoOpenid::Urls.evo.fqdn

    before_request do |name, request|
      request.get_params[:user_email] = nfg_evo_rest_user_email
      request.get_params[:user_token] = nfg_evo_rest_user_token
      append_param_fields_if_any(request)
    end

    post :onboarding, "/api/v1/onboarding/initial_setup", timeout: 60

    private

    def param_fields
      []
    end
  end
end