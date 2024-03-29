# frozen_string_literal: true

require 'flexirest'

module NfgEvoRestClient
  # @abstract Subclasses define specific RESTful API endpoints
  class Base < Flexirest::Base
    request_body_type :json

    before_request do |_name, request|
      base_url NfgEvoRestClient.nfg_evo_rest_base_url

      # if a bearer token is set, use it instead of the user_email and user_token
      # We should always be using the bearer token. We are keeping the user_email
      # and user_token for backwards compatibility.
      if NfgEvoRestClient.nfg_evo_rest_bearer_token.present?
        request.headers['Authorization'] = "Bearer #{NfgEvoRestClient.nfg_evo_rest_bearer_token}"
      else
        request.get_params[:user_email] = NfgEvoRestClient.nfg_evo_rest_user_email
        request.get_params[:user_token] = NfgEvoRestClient.nfg_evo_rest_user_token
      end

      append_param_fields_if_any(request)
    end

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
      fields = request.object.respond_to?(:param_fields) ? request.object.param_fields : []
      fields.each do |field_or_hash|
        field, value = field_or_hash.is_a?(Symbol) ? [field_or_hash, nil] : field_or_hash.first
        if request.object.respond_to?(field) && request.object.send(field).present?
          request.get_params[field] = request.object.send(field)
        elsif value
          # otherwise, force the api to return no results
          request.get_params[field] = value
        end
      end
    end
  end
end
