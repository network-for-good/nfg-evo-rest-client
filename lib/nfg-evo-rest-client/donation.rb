# frozen_string_literal: true

module NfgEvoRestClient
  # the Donation model allows you to retrieve donation information
  # You can limit which entity you want to retrieve data for by
  # setting the entity_id on the instance of the donation object
  # i.e. NfgEvoRestClient::Donation.new(entity_id: 999)
  # You can also adjust the begin and end dates in the same way
  # i.e. NfgEvoRestClient::Donation.new(from_date_time: "2016-02-01", to_date_time: "2016-02-29")
  class Donation < Base
    get   :all,             "/api/v1/donations",                      timeout: 60
    get   :find,            "/api/v1/donations/:id"
    post  :record_offline,  "/api/v1/donations/record_offline",       timeout: 60
    post  :edited_by_admin, "/api/v1/donations/:id/edited_by_admin",  timeout: 60
    post  :remove,          "/api/v1/donations/delete",               timeout: 60

    def param_fields
      [{entity_id: 0}, :from_date_time, :to_date_time]
    end
  end
end
