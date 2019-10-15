# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/authorizenet/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-authorizenet'
  spec.version       = Omniauth::Authorizenet::VERSION
  spec.authors       = ['Nadim El Taha']
  spec.email         = ['nadimeltaha@gmail.com']

  spec.summary       = ''
  spec.description   = ''
  spec.homepage      = 'https://github.com/Uscreen-video/omniauth-authorizenet'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'omniauth', '~> 1.3'
  spec.add_dependency 'omniauth-oauth2', '~> 1.4'
end
