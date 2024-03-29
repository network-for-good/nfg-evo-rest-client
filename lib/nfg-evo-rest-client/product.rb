# frozen_string_literal: true

module NfgEvoRestClient
  class Product < Base
    get :all, '/api/v1/products/'

    def param_fields
      []
    end
  end
end
