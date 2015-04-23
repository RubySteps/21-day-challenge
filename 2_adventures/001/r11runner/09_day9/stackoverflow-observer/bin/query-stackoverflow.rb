#!/usr/bin/env ruby
require_relative '../lib/stackoverflow-observer'

def main
  args = StackOverflowObserver::StackOverflowQueryOptionParser.retrieve_args
  report = StackOverflowObserver::StackOverflowReport.new args[:tags], args[:hours]
  puts report.output
end

main
