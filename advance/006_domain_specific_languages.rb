# Internal DSL for API Testing
class APIDSL
  def self.describe(endpoint, &block)
    tester = new(endpoint)
    tester.instance_eval(&block)
    tester.run
  end

  def initialize(endpoint)
    @endpoint = endpoint
    @tests = []
  end

  def expect(response_key, &validator)
    @tests << [response_key, validator]
  end

  def run
    response = { user: "admin", status: "active" } # Simulated API response
    @tests.each do |key, validator|
      puts "Testing #{key}: #{validator.call(response[key]) ? 'PASS' : 'FAIL'}"
    end
  end
end

APIDSL.describe "/user" do
  expect(:user) { |val| val.is_a?(String) }
  expect(:status) { |val| %w[active pending].include?(val) }
end
