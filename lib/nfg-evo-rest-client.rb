# frozen_string_literal: true

require 'nfg-evo-rest-client/version'
require 'nfg-evo-rest-client/configuration'
require 'nfg-evo-rest-client/base'
require 'nfg-evo-rest-client/admin'
require 'nfg-evo-rest-client/campaign'
require 'nfg-evo-rest-client/donation'
require 'nfg-evo-rest-client/donor'
require 'nfg-evo-rest-client/entity'
require 'nfg-evo-rest-client/project'
require 'nfg-evo-rest-client/ticket_purchase'
require 'nfg-evo-rest-client/onboarding'
require 'nfg-evo-rest-client/product'
require 'nfg-evo-rest-client/questionnaires/questionnaire'
require 'nfg-evo-rest-client/questionnaires/response'

# Provides a wrapper to the EVO/Fundraising Pages API
# @see https://github.com/network-for-good/Givecorps-site/tree/develop/api
module NfgEvoRestClient
  # General exception class for the gem
  class Error < StandardError; end
end
