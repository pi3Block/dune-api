# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'factories'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

RSpec.configure do |config|
  config.include RSpec::Rails::ControllerExampleGroup,
     file_path: %r(spec/controllers)
  config.use_transactional_fixtures = true

  # Stubs required from the main application
  config.before(:each) do
    double(::UserObserver)
    allow_any_instance_of(UserObserver).to receive(:after_create)
    allow_any_instance_of(UserObserver).to receive(:after_save)
  end
end
