require "nfg-evo-rest-client/version"
require "nfg-evo-rest-client/configuration"
require "nfg-evo-rest-client/base"
require "nfg-evo-rest-client/admin"
require "nfg-evo-rest-client/donation"
require "nfg-evo-rest-client/donor"
require "nfg-evo-rest-client/entity"
require "nfg-evo-rest-client/project"
require "nfg-evo-rest-client/ticket_purchase"
require "nfg-evo-rest-client/questionnaires/questionnaire"
require "nfg-evo-rest-client/questionnaires/response"

module NfgEvoRestClient
  class Error < StandardError; end
end
