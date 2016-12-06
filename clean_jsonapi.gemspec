lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clean_jsonapi/version'

Gem::Specification.new do |s|
  s.name        = 'clean_jsonapi'
  s.version     = CleanJSONAPI::VERSION
  s.date        = '2016-12-06'
  s.summary     = 'Implementation of JSONAPI using good patterns'
  s.description = 'Implementation of JSONAPI using good patterns'
  s.authors     = ['Thiago Rodrigues de Paula']
  s.email       = 'thiago.rdp@gmail.com'
  s.homepage    =
    'https://github.com/thiagorp/clean_jsonapi'
  s.license       = 'MIT'

  s.files         = Dir.glob("{bin,lib}/**/*")
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec'
end
