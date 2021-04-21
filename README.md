# NfgEvoRestClient

Uses the Flexirest gem to provide a wrapper to the EVO/Fundraising Pages API.

This is primarily used by DM, but could also be used by other applications that need access to the api.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nfg-evo-rest-client', git: 'https://github.com/network-for-good/nfg-evo-rest-client.git'
```

## Configuration

Three config variables need to be set:

```ruby
NfgEvoRestClient::Base.nfg_evo_rest_base_url   = APP_CONFIG["evo_api"]["base_url"]
NfgEvoRestClient::Base.nfg_evo_rest_user_email = APP_CONFIG["evo_api"]["user_email"]
NfgEvoRestClient::Base.nfg_evo_rest_user_token = APP_CONFIG["evo_api"]["user_token"]
```

## Test Suite

We use VCR to record live responses from the FP beta API. To re-record the specs:

```bash
NFG_API_URL=https://api.networkforgood*.com/api/v1/ # default value is admin.networkforgood-beta.com
NFG_USER_EMAIL=mike@example.com                     # censored from storage by VCR
NFG_USER_TOKEN=####################                 # censored from storage by VCR

rm spec/fixtures/vcr_cassettes/* ; rspec spec      # re-run all specs while recording fresh API responses
```

## Direct Testing of FP APIs

```bash
user_agent='Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0'
curl -A $user_agent "https://admin.networkforgood-beta.com/api/v1/campaigns?user_email=mike@example.com&user_token=###&entity_id=1" > campaigns.json
```

## Building and Releasing

1. Initial setup: add your [GitHub personal access token](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) `~/.gem/credentials` like so:

```yaml
---
:github: Bearer ########################################
```

2. Bump and commit the version number in `lib/nfg-evo-rest-client/version.rb`.

3. Tag the commit with the new version number for future reference (we may want to use this for continuous deployment in the future):

```bash
git tag -a v#.#.# -m "summarize changes here"
```

4. Run the following command:

```bash
rake build
gem push --key github --host https://rubygems.pkg.github.com/network-for-good pkg/nfg-evo-rest-client-#.#.#.gem
```

## Authors

* @hoenth
* @subelsky
