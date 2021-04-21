# frozen_string_literal: true

# Makes it easy for specs to require the related lib file
lib = File.expand_path('../lib/nfg-evo-rest-client', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'nfg-evo-rest-client'
require 'webmock/rspec'

WebMock.disable_net_connect!

# These values would be set when re-recording a VCR cassette; VCR would be configured to
# replace sensitive values in the cassette data.
# @see api_test_helper.rb
NFG_API_URL           = ENV.fetch('NFG_API_URL', 'https://api.networkforgood-beta.com')
NFG_USER_EMAIL        = ENV.fetch('NFG_USER_EMAIL', 'a@example.com')
NFG_USER_TOKEN        = ENV.fetch('NFG_USER_TOKEN', 'exampletoken')
NFG_DEFAULT_ENTITY_ID = ENV.fetch('NFG_DEFAULT_ENTITY_ID', 2) # 'admin' entity by default

NfgEvoRestClient.nfg_evo_rest_base_url   = NFG_API_URL
NfgEvoRestClient.nfg_evo_rest_user_email = NFG_USER_EMAIL
NfgEvoRestClient.nfg_evo_rest_user_token = NFG_USER_TOKEN

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  # This option will default to `:apply_to_host_groups` in RSpec 4 (and will
  # have no way to turn it off -- the option exists only for backwards
  # compatibility in RSpec 3). It causes shared context metadata to be
  # inherited by the metadata hash of host groups and examples, rather than
  # triggering implicit auto-inclusion in groups with matching metadata.
  config.shared_context_metadata_behavior = :apply_to_host_groups

  # This allows you to limit a spec run to individual examples or groups
  # you care about by tagging them with `:focus` metadata. When nothing
  # is tagged with `:focus`, all examples get run. RSpec also provides
  # aliases for `it`, `describe`, and `context` that include `:focus`
  # metadata: `fit`, `fdescribe` and `fcontext`, respectively.
  config.filter_run_when_matching :focus

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = 'spec/examples.txt'

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  #   - http://rspec.info/blog/2012/06/rspecs-new-expectation-syntax/
  #   - http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://rspec.info/blog/2014/05/notable-changes-in-rspec-3/#zero-monkey-patching-mode
  config.disable_monkey_patching!

  # This setting enables warnings. It's recommended, but in some cases may
  # be too noisy due to issues in dependencies.
  config.warnings = true

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  # config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  config.full_backtrace = false

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
end

# NOTE: the below code makes it possible for us to record and playback live
# API response from the beta server; unfortunately I was not able to reliably
# get API calls to work from the dev or test environments; potentially
# Cloudfront-related. Saving this for another day.

require 'vcr'

# CloudFront will block requests that do not look browser-originated, like
# the ones we are making from our live VCR test suite
BROWSER_USER_AGENT = 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0'

Flexirest::Base.faraday_config do |faraday|
  faraday.adapter(:net_http)
  faraday.headers['User-Agent'] = BROWSER_USER_AGENT
end

VCR.configure do |config|
  config.cassette_library_dir = "#{__dir__}/fixtures/vcr_cassettes"
  config.hook_into :webmock

  # These two lines allow us to re-record API responses with real
  # credentials, without saving them to the cassette fixture.
  # When the matching ENV variables are not set, the default
  # values are replaced seamlessly, so the test can be re-run
  # without needing to access the original values.
  config.filter_sensitive_data('<NFG_USER_EMAIL>') { NFG_USER_EMAIL }
  config.filter_sensitive_data('<NFG_USER_TOKEN>') { NFG_USER_TOKEN }
end
