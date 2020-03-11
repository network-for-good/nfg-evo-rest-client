module NfgEvoRestClient
  class Base < Flexirest::Base
    include NfgEvoRestClient::Configuration
    request_body_type :json

    base_url nfg_evo_rest_base_url

    private

    def self.append_param_fields_if_any(request)
      # for each field, see if a value has been provided when instantiating
      # the object and if so, assign it to the params for the call to the
      # NfgEvoService. If no value has been provided, but a default value
      # was included in the param_field by passing a hsh, set the value
      # to the default value. The request object is this class, or the
      # inheriting class, which is passed to the request object.
      # You can set the request objects values by passing in a hash of
      # values when instantiating the object.
      # i.e. NfgEvoRestClient::Donation.new(from_date_time: "2016-02-01", to_date_time: "2016-02-29")
      param_fields.each do |field_or_hash|
        field, value = field_or_hash.is_a?(Symbol) ? [field_or_hash, nil] : field_or_hash.first
        if request.object.respond_to?(field) && request.object.send(field).present?
          request.get_params[field] = request.object.send(field)
        else
          if value
          # otherwise, force the api to return no results
            request.get_params[field] = value
          end
        end
      end
    end

    def self.param_fields
      # this can be overridden in the inheriting class. It should return
      # an array of symbols or hashes with symbols as keys. The values in the
      # represent a default value that is set and included in the params for
      # the API call
      # i.e. [:from_date, :to_date, number_of_records: 20]
      []
    end

  end
end