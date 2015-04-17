$LOAD_PATH.unshift './lib', './test'

require 'minitest/autorun'
require 'minitest/reporters'
require 'spec_config'

# To select a different reporter copy the spec/spec_config.rb.example to
# spec/spec_config.rb and select the reporter you wish to use.
OPTION = if ENV['REPORT']
           { report_style: ENV['REPORT'] }
         else
           File.exist? './spec/spec_config.rb'  and
                  require('./spec/spec_config') or
                  { report_style: 'Default' }
         end

Minitest::Reporters.use!(
  instance_eval(
    "Minitest::Reporters::#{OPTION[:report_style]}Reporter.new")
)
