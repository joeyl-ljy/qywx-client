# frozen_string_literal: true

module Qywx
  module Client
    module GroupRobotClient
      module NotifyMarkdown
        # @param code  [Symbol] set token_code and template_file
        # @param title [String]
        # @option options [String]  template_file (code)  without file suffix
        # @yield a block which will execute in template locale environment
        def notify_markdown(code, title, **options, &block)
          options.with_defaults!(
            template_file: code
          )
          token_code = code.to_sym
          token = fetch_token(token_code)
          title = String(title)
          template_file = String(options[:template_file])
          content = get_markdown_content(template_file, &block)
          body = get_markdown_body(title, content)
          notify(token, body)
        end

        private

        # @param template_file [String]
        # @yield a block which will execute in template locale environment
        def get_markdown_content(template_file, &block)
          instance_eval(&block) if block
          path = "#{Qywx::Client.config.template_dir}/#{template_file}.markdown.erb"
          ERB.new(File.read(path)).result(binding)
        rescue Errno::ENOENT
          raise ArgumentError, "Not found template: #{File.expand_path(path)}"
        end

        # @param title      [String]
        # @param content    [String]
        # @return [Hash]
        def get_markdown_body(title, content)
          {
            msgtype: 'markdown',
            markdown: {
              title: title,
              content: content
            }
          }
        end
      end
    end
  end
end
