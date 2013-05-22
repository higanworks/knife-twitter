#require "knife-twitter"
require 'chef/knife/twitter'
require 'chef/knife'

class Chef
  class Knife
    class TwitterTl < Knife
      include TwitterBase

      option :twitter_mentions,
        :short => "-m",
        :long => "--twitter_mentions",
        :description  => "enable mentions",
        :default  => false

      option :twitter_favorite,
        :short => "-f",
        :long => "--twitter_favorite",
        :description  => "enable favorite",
        :default  => false

      banner "knife twitter tl (options)"
      def run
        t_configure
        begin
          if locate_config_value(:twitter_mentions)
            timeline = Twitter.mentions_timeline
	  elsif locate_config_value(:twitter_favorite)
	    user_name = locate_config_value(:twitter_user_name)
	    timeline = Twitter.favorites("#{user_name}")
          else
            timeline = Twitter.home_timeline
          end
        rescue => e
          ui.fatal("Retrieve Failed! #=> #{e.class}")
          ui.fatal(e.message)
          exit
        end

        tl_list = []
        timeline.map do |tl|
          tl_list << ui.color(tl[:user][:screen_name], :cyan)
          tl_list << ui.color(tl[:created_at].to_s, :magenta)
          tl_list << ui.color(tl[:text])
        end

        puts ui.list(tl_list, :uneven_columns_across, 3)
      end

    end

  end
end
