class TinyTest
  def self.run_all(tests, result)
    tests.each do |test|
      test.run(result)
    end
    self
  end

  def self.specify(name, suite_stack=Suite.stack, &block)
    Suite.new.tap do |s|
      s.instance_exec(&block)
      suite_stack.push(s)
    end
  end

  module Assertions
    class Failed < StandardError; end

    def assert(condition, message="Expected assertion to be to true, was false.")
      unless condition
        raise Failed, message
      end
    end

    def assert_equal(expected, actual, message=nil)
      message ||= "Expected '#{expected.inspect}' to `==` '#{actual.inspect}'"
      assert expected == actual, message
    end
  end

  class Result
    attr_reader :passed_count, :failed_count, :failures

    def initialize
      @passed_count = 0
      @failures = []
    end

    def add_failure(test, exception)
      @failures << Failure.new(test, exception)
      self
    end

    def add_pass(test)
      @passed_count += 1
      self
    end

    def failed_count
      failures.count
    end

    def run_count
      failed_count + passed_count
    end
  end

  class Failure < Struct.new(:test, :exception)
  end

  class Suite

    def self.stack
      @suite_stack ||= []
    end

    def initialize
      @tests = []
    end

    def run(result)
      @tests.each do |test|
        test.run(result)
      end
      self
    end

    def must(name, &test)
      add(TestCase.new(test))
      self
    end

    def each(*args, &block)
      @tests.each(*args, &block)
    end

    private

    def add(test)
      @tests << test
    end
  end

  class TestCase < Struct.new(:test_block)
    def self.define(&test_block)
      new(test_block)
    end

    def run(result)
      begin
        fix = Fixture.new
        fix.instance_exec(&test_block)
      rescue Object => exception
        result.add_failure(self, exception)
      else
        result.add_pass(self)
      end
      self
    end
  end

  class Fixture
    include Assertions
  end

end

