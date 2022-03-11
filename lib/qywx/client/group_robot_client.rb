# frozen_string_literal: true

require 'qywx/client/group_robot_client/core'
require 'qywx/client/group_robot_client/notify_text'
require 'qywx/client/group_robot_client/notify_markdown'
require 'qywx/client/group_robot_client/notify_feedcard'

module Qywx
  module Client
    module GroupRobotClient
      include HTTParty
      include Core
      include NotifyText
      include NotifyMarkdown
      include NotifyFeedcard
      base_uri Qywx::Client.config.group_robot_webhook_prefix
      headers  'Content-Type' => 'application/json'
      logger   ::Logger.new($stdout), :debug, :curl if Qywx::Client.config.is_debugging
    end
  end
end
