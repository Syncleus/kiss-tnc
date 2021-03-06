# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kiss/app_info'

Gem::Specification.new do |spec|
    spec.name = 'kiss-tnc'
    spec.version = Kiss::VERSION
    spec.licenses = ['Apache-2.0']
    spec.authors = ['Jeffrey Phillips Freeman']
    spec.email = ['jeffrey.freeman@syncleus.com']

    spec.summary = %q{Library for KISS communication with TNCs.}
    spec.description = %q{Ruby library for KISS communication with Terminal Node Controllers.}
    spec.homepage = 'https://github.com/Syncleus/aprs'

    # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
    # to allow pushing to a single host or delete this section to allow pushing to any host.
    if spec.respond_to?(:metadata)
        spec.metadata['allowed_push_host'] = "https://rubygems.org"
    else
        raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
    end

    spec.files = `git ls-files -z`.split("\x0").reject do |f|
        f.match(%r{^(test|spec|features)/})
    end
    spec.bindir = 'exe'
    spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
    spec.require_paths = ['lib']

    spec.add_dependency 'abstraction', '~> 0.0.4'
    spec.add_dependency 'serialport', '~> 1.3'
    spec.add_development_dependency 'bundler', '~> 1.7'
    spec.add_development_dependency 'rake', '~> 11.3'
    spec.add_development_dependency 'rdoc', '~> 4.2'
    spec.add_development_dependency 'aruba', '~> 0.14'
end
