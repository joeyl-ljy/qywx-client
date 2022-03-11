# frozen_string_literal: true

require 'httparty'
require 'active_support/all'
require 'qywx/client/errors'
require 'qywx/client/result'

module Qywx
  # Qywx Client
  # @see https://developer.work.weixin.qq.com/document/path/91770
  module Client
    extend ActiveSupport::Autoload
    autoload :Configurable
    autoload :GroupRobotClient
    include Configurable
    include GroupRobotClient
    extend self
  end
end
