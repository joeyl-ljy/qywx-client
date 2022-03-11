# frozen_string_literal: true

module Qywx
  module Client
    module GroupRobotClient
      module NotifyText
        # @param code    [Symbol] set token_code and template_file
        # @param content [String]
        # @option options [String]  template_file (code)  without file suffix
        # @option options [Array] at_users     (["wangqing","@all"])
        # @option options [Array]   at_mobiles    (["13800001111","@all"])
        def notify_text(code, content, **options)
          options.with_defaults!(
            at_users: [],
            at_mobiles: []
          )
          token_code = code.to_sym
          token = fetch_token(token_code)
          content = String(content)
          at_users = Array(options[:at_users]).presence
          at_mobiles = Array(options[:at_mobiles]).presence
          body = get_text_body(content, at_users, at_mobiles)
          notify(token, body)
        end

        private

        # @param content    [String]
        # @param at_users  [Array]
        # @param at_mobiles [Array]
        # @return [Hash]
        def get_text_body(content, at_users, at_mobiles)
          {
            msgtype: 'text',
            text: {
              content: content,
              mentioned_mobile_list: at_mobiles,
              mentioned_list: at_users
            }.compact
          }
        end
      end
    end
  end
end
