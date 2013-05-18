#require "knife-twitter"
require 'chef/knife/twitter'
require 'chef/knife'

class Chef
  class Knife
    class TwitterPost < Knife
      include TwitterBase

      option :twitter_message,
        :short => "-m TWEET_MEAASAGE",
        :long => "--twitter_message",
        :description  => "Your Tweet",
        :proc => Proc.new { |message| Chef::Config[:knife][:twitter_message] = message },
        :default => "Tweet with knife-twitter " + ::Knife::Twitter::VERSION + " " + Time.now.to_s

      banner "knife twitter post (options)"
      def run
        t_configure
        begin
          Twitter.update(locate_config_value(:twitter_message))
          ui.info("Tweet Success! #=> #{locate_config_value(:twitter_message)}")
        rescue => e
          ui.fatal("Tweet Failed! #=> #{e.class}")
          ui.fatal(e.message)
        end
      end

    end

  end
end
