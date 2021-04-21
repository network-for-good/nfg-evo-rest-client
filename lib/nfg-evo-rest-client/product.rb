module NfgEvoRestClient
  class Product < Base
    get :all, "/api/v1/products/"

    private

    def param_fields
      []
    end
  end
end
