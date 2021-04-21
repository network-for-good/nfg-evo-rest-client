module NfgEvoRestClient
  class Donor < Base
    post :reconcile, "/api/v1/donors/reconcile", timeout: 60
    post :remove, "/api/v1/donors/delete", timeout: 60
    post :merge, "/api/v1/donors/merge", timeout: 60

    def param_fields
      [:entity_id]
    end
  end
end
