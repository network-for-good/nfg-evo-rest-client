module NfgEvoRestClient
  class TicketPurchase < Base
    # can't get the value set in the initializer to populate
    # the base_url as the class is being loaded before the initializer
    # is run.
    base_url SsoOpenid::Urls.evo.fqdn

    verbose true

    # the Donation model allows you to retrieve donation information
    # You can limit which entity you want to retrieve data for by
    # setting the entity_id on the instance of the donation object
    # i.e. NfgEvoRestClient::Donation.new(entity_id: 999)
    # You can also adjust the begin and end dates in the same way
    # i.e. NfgEvoRestClient::Donation.new(from_date_time: "2016-02-01", to_date_time: "2016-02-29")

    before_request do |name, request|
      request.get_params[:user_email] = nfg_evo_rest_user_email
      request.get_params[:user_token] = nfg_evo_rest_user_token
      append_param_fields_if_any(request)
    end

    get :all, "/api/v1/ticket_purchases"
    get :find, "/api/v1/ticket_purchases/:id"

    private

    def param_fields
      [{entity_id: 0}, :from_date_time, :to_date_time]
    end
  end
end
