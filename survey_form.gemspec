$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "survey_form/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "survey_form"
  spec.version     = SurveyForm::VERSION
  spec.authors     = ["Sokly"]
  spec.email       = ["hengsokly23@gmail.com"]
  # spec.homepage    = "survey_form"
  spec.summary     = "Survey Form with dynamic fields"
  # spec.description = "Survey Form with dynamic fields."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.2"

  spec.add_development_dependency "pg"
end
