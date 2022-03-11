# frozen_string_literal: true

module Qywx
  module Client
    module GroupRobotClient
      module NotifyFeedcard
        # @param code    [Symbol] set token_code and template_file
        # @param links   [Array<Hash>, Hash]
        def notify_feedcard(code, links)
          token_code = code.to_sym
          token = fetch_token(token_code)
          links = Array.wrap(links).map do |link|
            Hash(link).symbolize_keys.tap do |hash|
              required_keys = %i[title url picurl]
              keys_valid = required_keys.all? { |arg| hash[arg].present? }
              raise ArgumentError, "links requires these keys present: #{required_keys.join(', ')}" unless keys_valid
            end
          end
          body = get_feedcard_body(links)
          notify(token, body)
        end

        private

        # @param links [Array<Hash>]
        # @return [Hash]
        def get_feedcard_body(links)
          {
            msgtype: 'news',
            news: {
              articles: links
            }
          }
        end
      end
    end
  end
end
