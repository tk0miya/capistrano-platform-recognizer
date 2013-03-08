# Capistrano::Platform::Recognizer

Capistrano task to recognize platform of target hosts

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-platform-recognizer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-platform-recognizer

## Usage

load capistrano-rails-dbinit in your config/deploy.rb:

    require 'capistrano-rails-dbinit'

And then, capistrano-platform-recognizer runs automatically and
set platform informations to each hosts.

- :osname (:linux, :darwin, etc)
- :distro (:centos5, :rhel5, :amazon, etc)
- :cpu (:i386 or :x86_64)

You can filter with platform infomation using :only filter:

    task(:setup_apps, :only => {:distro => :centos5}) do
      # ...
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
