require "knife-twitter"
require 'chef/knife'

class Chef
  class Knife
    module TwitterBase
      def self.included(includer)
        includer.class_eval do

          deps do
            require 'twitter'
          end

          option :twitter_consumer_key,
            :short => "-K CONSUMER_KEY",
            :long => "--twitter_consumer_key",
            :description  => "Your Twitter Consumer Key",
            :proc => Proc.new { |key| Chef::Config[:knife][:twitter_consumer_key] = key }

          option :twitter_consumer_secret,
            :short => "-S CONSUMER_SECRET",
            :long => "--twitter_consumer_secret",
            :description  => "Your Twitter Consumer Secret",
            :proc => Proc.new { |key| Chef::Config[:knife][:twitter_consumer_secret] = key }

          option :twitter_oauth_token,
            :short => "-o TOKEN",
            :long => "--twitter_oauth_token",
            :description  => "Your Twitter OAuth Token",
            :proc => Proc.new { |key| Chef::Config[:knife][:twitter_oauth_token] = key }

          option :twitter_oauth_token_secret,
            :short => "-O TOKEN_SECRET",
            :long => "--twitter_oauth_token_secret",
            :description  => "Your Twitter OAuth Token Secret",
            :proc => Proc.new { |key| Chef::Config[:knife][:twitter_oauth_token_secret] = key }

          option :twitter_user_name,
            :short => "-u USER_NAME",
            :long => "--twitter_user_name",
            :description  => "Your Twitter User Name",
            :proc => Proc.new { |key| Chef::Config[:knife][:twitter_user] = key }

        end
      end

      def locate_config_value(key)
        key = key.to_sym
        Chef::Config[:knife][key] || config[key]
      end

      def msg_pair(label, value, color=:cyan)
        if value && !value.to_s.empty?
          puts "#{ui.color(label, color)}: #{value}"
        end
      end

      def t_configure
        Twitter.configure do |config|
          config.consumer_key       = locate_config_value(:twitter_consumer_key)
          config.consumer_secret    = locate_config_value(:twitter_consumer_secret)
          config.oauth_token        = locate_config_value(:twitter_oauth_token)
          config.oauth_token_secret = locate_config_value(:twitter_oauth_token_secret)
        end
      end
    end

    class TwitterVersion < Knife
      include TwitterBase
      banner "knife twitter version"
      def run
        msg_pair("VERSION", ::Knife::Twitter::VERSION, :blue)
        msg_pair("CONSUMER_KEY", locate_config_value(:twitter_consumer_key))
        msg_pair("CONSUMER_SECRET", locate_config_value(:twitter_consumer_secret))
        msg_pair("TOKEN", locate_config_value(:twitter_oauth_token))
        msg_pair("TOKEN_SECRET", locate_config_value(:twitter_oauth_token_secret))
        msg_pair("USER_NAME", locate_config_value(:twitter_user))
      end
    end

  end
end
