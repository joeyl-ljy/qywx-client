# frozen_string_literal: true

module Qywx
  module Client
    # @example Config single item
    #   Qywx::Client.group_robot_tokens = { default: 'TOKENXXXXXXXXXXX' }
    # @example Config multiple items
    #   Qywx::Client.configure do |config|
    #     config.group_robot_tokens         = { default: 'TOKENXXXXXXXBBXX' }
    #     config.group_robot_webhook_prefix = 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key='
    #   end
    module Configurable
      def self.included(base)
        base.extend ClassMethods
      end

      # @see Configurable
      module ClassMethods
        def configure
          yield config
        end

        def config
          @config ||= Configuration.new
        end
      end

      # @see Configurable
      class Configuration
        attr_writer :group_robot_tokens, :group_robot_webhook_prefix, :template_dir
        attr_accessor :is_debugging

        def initialize
          @group_robot_webhook_prefix = 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key='
          @template_dir               = '.'
          @is_debugging               = false
        end

        def group_robot_tokens
          return @group_robot_tokens.symbolize_keys if @group_robot_tokens.is_a?(Hash)

          raise ConfigurationError.new(:group_robot_tokens, @group_robot_tokens, Hash)
        end

        def group_robot_webhook_prefix
          String(@group_robot_webhook_prefix)
        end

        def template_dir
          String(@template_dir)
        end
      end
    end
  end
end
