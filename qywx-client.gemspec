# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qywx/client/version'

Gem::Specification.new do |spec|
  spec.name          = 'qywx-client'
  spec.version       = Qywx::Client::VERSION
  spec.authors       = ['joeyl']
  spec.email         = ['lu.joeyl.lu@gmail.com']

  spec.summary       = '企业微信机器人.'
  spec.description   = '企业微信机器人.'
  spec.homepage      = 'https://github.com/joeyl-ljy/qywx-client'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_dependency 'activesupport', '~> 5.2.1'
  spec.add_dependency 'httparty',      '~> 0.16.2'
end
