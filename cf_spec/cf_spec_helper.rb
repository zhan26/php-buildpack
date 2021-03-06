require 'bundler/setup'
require 'machete'
require 'machete/matchers'

`mkdir -p log`
Machete.logger = Machete::Logger.new("log/integration.log")

RSpec.configure do |config|
  config.color = true
  config.tty = true

  config.filter_run_excluding :cached => ENV['BUILDPACK_MODE'] == 'uncached'
  config.filter_run_excluding :uncached => ENV['BUILDPACK_MODE'] == 'cached'
end

def deploy_app(app_name, config)
    Machete.deploy_app(
      app_name,
      config
    )
end
