module NfgEvoRestClient
  class Admin < Base
    # can't get the value set in the initializer to populate
    # the base_url as the class is being loaded before the initializer
    # is run.
    base_url ::SsoOpenid::Urls.evo.fqdn

    verbose true

    before_request do |name, request|
      request.get_params[:user_email] = nfg_evo_rest_user_email
      request.get_params[:user_token] = nfg_evo_rest_user_token
      append_param_fields_if_any(request)
    end

    post :create, "/api/v1/admins", timeout: 60

    def param_fields
      [:entity_id]
    end
  end
end