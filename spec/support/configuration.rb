# frozen_string_literal: true

Qywx::Client.configure do |config|
  config.template_dir = "#{__dir__}/../files"
  config.group_robot_tokens = {
    test: 'TOKEN',
    invalid_token: 'INVALID_TOKEN'
  }
end
