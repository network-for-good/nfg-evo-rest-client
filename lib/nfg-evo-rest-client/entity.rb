# frozen_string_literal: true

module NfgEvoRestClient
  class Entity < Base
    # can't get the value set in the initializer to populate
    # the base_url as the class is being loaded before the initializer
    # is run.
    base_url SsoOpenid::Urls.evo.fqdn

    verbose true

    before_request do |_, request|
      request.get_params[:user_email] = nfg_evo_rest_user_email
      request.get_params[:user_token] = nfg_evo_rest_user_token
      append_param_fields_if_any(request)
    end

    get :all, '/api/v1/entities'
    get :find, '/api/v1/entities/:id'

    post :deactivate, '/api/v1/entities/:id/deactivate', timeout: 60

    private

    def param_fields
      []
    end
  end
end
