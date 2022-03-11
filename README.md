# Qywx Client

A simple HTTP client wrapper for [Qywx](https://developer.work.weixin.qq.com/document/path/91770)

[![Gem Version](https://badge.fury.io/rb/qywx-client.svg)](https://rubygems.org/gems/qywx-client)
[![Documentation](https://img.shields.io/badge/docs-YARD-blue.svg)](https://rubydoc.info/gems/qywx-client)
[![Build Status](https://api.travis-ci.org/songhuangcn/qywx-client.svg)](https://travis-ci.org/joeyl-ljy/qywx-client)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'qywx-client'
```

And then execute:


```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install qywx-client
```

## Usage

### Group Robot Message

```ruby
# Config api token and message template directory
Qywx::Client.configure do |config|
  config.template_dir = '.'
  config.group_robot_tokens = { order: 'TOKEN' }
end
system %q(echo '> <%= @message %>' > order.markdown.erb)

# Notify markdown type message
Qywx::Client.notify_markdown(:order, 'Title') { @message = 'Awesome message' }

# Notify feedcard type
links = [{ title: 'title1', url: '...', picurl: '...' }, { title: 'title2', url: '...', picurl: '...' }]
Qywx::Client.notify_feedcard(:order, links)

# Notify text type
Qywx::Client.notify_text(:order, 'message')

# Want use instance variables in exist environment?
class OrderController < ApplicationContrller
  include Qywx::Client
  
  def index
    @message = 'Some message'
    notify_markdown(:order, 'Title')
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
