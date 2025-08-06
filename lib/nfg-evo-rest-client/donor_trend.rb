module NfgEvoRestClient
  class DonorTrend < Base
    get :index, "/api/v1/donor_trends", timeout: 60,
    post :mark_synced, "/api/v1/donor_trends/mark_synced", timeout: 60

    def param_fields
      [:entity_id, :synced]
    end
  end
end
