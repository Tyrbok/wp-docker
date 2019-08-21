lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = "wp-docker"
  spec.version = "0.0.1"
  spec.authors = ["Jesus Serrano"]
  spec.email = ["wp-docker@onepointzero.org"]


  "The easiest way to automate beta deployments and releases for your iOS and Android apps"
  spec.summary = "The easiest to for WordPress using Docker containers"
  spec.homepage = "https://github.com/Tyrbok/wp-docker"
  spec.license = "MIT"


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "bin"
  spec.executables = "wp-docker"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end