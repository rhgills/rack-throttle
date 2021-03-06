module SpecHelpers
  def example_target_app
    @target_app ||= double("Example Rack App")
    @target_app.stub(:call).and_return([200, {}, "Example App Body"])
    @target_app
  end

  RSpec::Matchers.define :show_allowed_response do
    match do |body|
      body.include?("Example App Body")
    end

    failure_message_for_should do
      "expected response to show the allowed response"
    end

    failure_message_for_should_not do
      "expected response not to show the allowed response"
    end

    description do
      "expected the allowed response"
    end
  end

  RSpec::Matchers.define :show_throttled_response do
    match do |body|
      body.include?("Rate Limit Exceeded")
    end

    failure_message_for_should do
      "expected response to show the throttled response"
    end

    failure_message_for_should_not do
      "expected response not to show the throttled response"
    end

    description do
      "expected the throttled response"
    end
  end
end