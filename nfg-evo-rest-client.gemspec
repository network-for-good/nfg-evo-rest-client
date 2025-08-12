# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'nfg-evo-rest-client/version'

Gem::Specification.new do |spec|
  spec.name          = 'nfg-evo-rest-client'
  spec.version       = NfgEvoRestClient::VERSION
  spec.authors       = ['Tom Hoen', 'Mike Subelsky']
  spec.email         = ['tom.hoen@networkforgood.com', 'mike.subelsky@networkforgood.com']

  spec.summary       = 'Library for using the EVO/Fundraising Pages API at Network For Good'
  spec.homepage      = 'https://github.com/network-for-good/nfg-evo-rest-client.git'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.5.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.pkg.github.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/network-for-good/nfg-evo-rest-client.git'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'yard'

  spec.add_dependency 'activesupport', '~> 7.2'
  spec.add_dependency 'flexirest'
  spec.add_dependency 'json'
end
