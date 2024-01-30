# rubocop:disable Naming/FileName
# frozen_string_literal: true

require 'nfg-evo-rest-client/version'
require 'nfg-evo-rest-client/base'
require 'nfg-evo-rest-client/admin'
require 'nfg-evo-rest-client/donation'
require 'nfg-evo-rest-client/donor'
require 'nfg-evo-rest-client/entity'
require 'nfg-evo-rest-client/event'
require 'nfg-evo-rest-client/project'
require 'nfg-evo-rest-client/ticket_purchase'
require 'nfg-evo-rest-client/sponsorship_purchase'
require 'nfg-evo-rest-client/onboarding'
require 'nfg-evo-rest-client/product'
require 'nfg-evo-rest-client/questionnaires/questionnaire'
require 'nfg-evo-rest-client/questionnaires/response'

# Provides a wrapper to the EVO/Fundraising Pages API
# @see https://github.com/network-for-good/Givecorps-site/tree/develop/api
module NfgEvoRestClient
  # General exception class for the gem
  Error = Class.new(StandardError)

  mattr_accessor :nfg_evo_rest_base_url, :nfg_evo_rest_user_email, :nfg_evo_rest_user_token, :nfg_evo_rest_bearer_token
end
# rubocop:enable Naming/FileName
