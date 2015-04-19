$:.unshift('lib', 'spec')
require 'minitest/autorun'
require "minitest/reporters"

# Reporter in this case with no choice but to use Spec format
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


