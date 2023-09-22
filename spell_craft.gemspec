# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

config = File.expand_path('config', __dir__)
$LOAD_PATH.unshift(config) unless $LOAD_PATH.include?(config)

Gem::Specification.new do |spec|
  spec.name        = 'spell_craft'
  spec.version     = '0.1.3'
  spec.summary     = 'Yet another code generator to make you type less stuff'
  spec.description = 'Yet another code generator to make you type less stuff'
  spec.authors     = ['Cherry Ramatis']
  spec.homepage    = 'https://github.com/cherryramatisdev/spell_craft.git'
  spec.license     = 'MIT'

  spec.required_ruby_version = '>= 3.2.0'

  spec.files = Dir['LICENSE', 'README.md', 'spell_craft.gemspec', 'config/**/*', 'lib/**/*']

  spec.require_paths = ['lib']
  spec.executables = ['spell_craft']

  spec.add_dependency 'dry-cli', '~> 1.0'
  spec.add_dependency 'sorbet-runtime', '~> 0.5.11026'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
