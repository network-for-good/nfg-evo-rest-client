module NfgEvoRestClient
  class Project < Base
    # can't get the value set in the initializer to populate
    # the base_url as the class is being loaded before the initializer
    # is run.
    base_url SsoOpenid::Urls.evo.fqdn

    verbose true

    # the Project model allows you to retrieve project information
    # You can limit which entity you want to retrieve data for by
    # setting the entity_id on the instance of the project object
    # i.e. NfgEvoRestClient::Project.new(entity_id: 999)
    # You can also adjust the begin and end dates in the same way
    # i.e. NfgEvoRestClient::Project.new(entity_id: 244, project_type: "everyday")

    before_request do |name, request|
      request.get_params[:user_email] = nfg_evo_rest_user_email
      request.get_params[:user_token] = nfg_evo_rest_user_token
      append_param_fields_if_any(request)
    end

    get :all, "/api/v1/projects", timeout: 60
    get :find, "/api/v1/projects/:id"

    private

    def param_fields
      [:entity_id, :search]
    end
  end
end
