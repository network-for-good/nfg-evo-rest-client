module NfgEvoRestClient
  class Onboarding < Base
    post :onboarding, "/api/v1/onboarding/initial_setup", timeout: 60

    private

    def param_fields
      []
    end
  end
end
