module NfgEvoRestClient
  class Donor < Base
    # can't get the value set in the initializer to populate
    # the base_url as the class is being loaded before the initializer
    # is run.
    base_url SsoOpenid::Urls.evo.fqdn

    verbose true

    before_request do |name, request|
      request.get_params[:user_email] = nfg_evo_rest_user_email
      request.get_params[:user_token] = nfg_evo_rest_user_token
      append_param_fields_if_any(request)
    end

    post :reconcile, "/api/v1/donors/reconcile", timeout: 60
    post :remove, "/api/v1/donors/delete", timeout: 60
    post :merge, "/api/v1/donors/merge", timeout: 60

    def param_fields
      [:entity_id]
    end
  end
end
