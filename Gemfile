source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in nfg-evo-rest-client.gemspec
gemspec

group :test, :development do
  #since this is only available through github, we can't add it as a development dependency
  # in the gem spec
  gem 'sso_openid', git: 'git://github.com/network-for-good/sso_openid.git', branch: 'rails_5'
end

