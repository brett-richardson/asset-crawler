ENV["RAILS_ROOT"] = File.expand_path("../../", __FILE__)
require File.expand_path("../../config/environment", __FILE__)

Teaspoon.setup do |config|
  config.suite do |suite|
    suite.no_coverage = [
      %r{/lib/ruby/gems/}, %r{/vendor/assets/}, %r{/support/}, %r{/(.+)_helper.},
      %r{/turbolinks}
    ]
  end
  # Driver / Server
  #config.driver = "phantomjs" # available: phantomjs, selenium
  #config.server = nil # defaults to Rack::Server

  # Behaviors
  #config.server_timeout      = 20 # timeout for starting the server
  #config.server_port         = nil # defaults to any open port unless specified
  #config.fail_fast           = true # abort after the first failing suite

  # Output
  #config.formatters          = "dot" # available: dot, tap, tap_y, swayze_or_oprah
  #config.suppress_log        = false # suppress logs coming from console[log/error/debug]
  config.color               = true

  # Coverage (requires istanbul -- https://github.com/gotwarlost/istanbul)
  config.coverage                      = true
  config.coverage_reports              = 'text,text-summary'
  config.coverage_output_dir           = 'coverage'
  config.statements_coverage_threshold = 75
  config.functions_coverage_threshold  = 50
  config.branches_coverage_threshold   = 50
  config.lines_coverage_threshold      = 75
end
