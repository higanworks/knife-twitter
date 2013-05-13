# Knife-Twitter

A Knife(Opscode Chef) plugin for [Twitter](http://twitter.com). You can post a tweet via knife and retrive your timeline or mentions on current terminal.

## Installation

Add this line to your application's Gemfile:

### from Rubygems

    gem 'knife-twitter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install knife-twitter

### from github

Drop the following line into your application's `Gemfile`.

    gem 'knife-zcloudjp', :git => "git://github.com/higanworks/knife-zcloudjp.git"

And execute the `bundle` command.

    $ bundle


## Usage

### Configration

Pass your twitter Tokens via `command line option` or `knfe.rb`. `knife.rb` takes precedence over the `command line option`.


Add the following entries to your `.chef/knife.rb`.

```
## Twitter
knife[:twitter_consumer_key]       = 'YOUR_CONSUMER_KEY'
knife[:twitter_consumer_secret]    = 'YOUR_CONSUMER_SECRET'
knife[:twitter_oauth_token]        = 'YOUR_OAUTH_TOKEN'
knife[:twitter_oauth_token_secret] = 'YOUR_OAUTH_TOKEN_SECRET'
```

Or use common command line option.

```
-K CONSUMER_KEY,                 Your Twitter Consumer Key
  --twitter_consumer_key
-S CONSUMER_SECRET,              Your Twitter Consumer Secret
  --twitter_consumer_secret
-o TOKEN,                        Your Twitter OAuth Token
  --twitter_oauth_token
-O TOKEN_SECRET,                 Your Twitter OAuth Token Secret
  --twitter_oauth_token_secret
```

## SubCommands

** TWITTER COMMANDS **

- knife twitter version
- knife twitter post (options)
- knife twitter tl (options)


### knife twitter version

Show plugin verson and show current Tokens.

```
$ knife twitter version 
VERSION: 0.1.0
CONSUMER_KEY: *************
CONSUMER_SECRET: **************************
TOKEN: **************************
TOKEN_SECRET:**************************
```

### knife twitter post (options)

Tweet via knife.

#### Option

```
-m TWEET_MEAASAGE,               Your Tweet
   --twitter_message
```


Tweet a default message.

```
$ knife twitter post
Tweet Success! #=> Tweet with knife-twitter 0.1.0 2013-05-13 22:39:10 +0900
```

Tweet with your message.

```
$ knife twitter post -m 'Hello Chef!'
Tweet Success! #=> Hello Chef!
```


### knife twitter tl (options)

Show current timeline or mensions.

#### Option

```
-m, --twitter_mentions           enable mentions
```

Retrieve a timeline.

```
$ knife twitter tl 
higanworks      2013-05-13 22:41:47 +0900  Hello Chef!                                                                          
higanworks      2013-05-13 22:39:12 +0900  Tweet with knife-twitter 0.1.0 2013-05-13 15:39:10 +0900                             
higanworks      2013-05-13 21:31:48 +0900  Tweet with knife-twitter 0.0.1 2013-05-13 14:31:47 +0900                             
higanworks      2013-05-13 21:29:20 +0900  Tweet with knife-twitter 0.0.1 2013-05-13 14:29:19 +0900                             
higanworks      2013-05-13 21:28:37 +0900  Tweet with knife-twitter 0.0.1 2013-05-13 14:28:37 +0900                             
higanworks      2013-05-13 20:46:45 +0900  test2                                                                                
higanworks      2013-05-13 13:33:23 +0900  Tweet with knife-twitter 0.0.1 2013-05-13 13:33:23 +0900                             
higanworks      2013-05-12 19:28:59 +0900  I'm tweeting with @gem!                                                              
DatasetStalker  2013-05-07 01:20:15 +0900  New dataset appeared. riak:13.1.0:1567edb0-b33e-11e2-a0d2-bf73e2825ffe #joyent       
DatasetStalker  2013-05-04 00:21:31 +0900  New dataset appeared. nodejs:13.1.0:beb2dbd4-b26f-11e2-8ad4-935c80092aa6 #joyent     
DatasetStalker  2013-05-02 05:20:09 +0900  New dataset appeared. percona:13.1.0:3882b5da-b0e8-11e2-b3a9-dbcf26c3e051 #joyent    
DatasetStalker  2013-04-27 00:20:23 +0900  New dataset appeared. base64:13.1.0:9eac5c0c-a941-11e2-a7dc-57a6b041988f #joyent     
DatasetStalker  2013-04-27 00:20:23 +0900  New dataset appeared. base:13.1.0:f669428c-a939-11e2-a485-b790efc0f0c1 #joyent       
DatasetStalker  2013-04-25 01:20:57 +0900  New dataset appeared. centos-6:2.4.1:87c556ac-ab9d-11e2-914d-07682fcab47d #joyent    
DatasetStalker  2013-04-19 04:23:49 +0900  New dataset appeared. debian-6.0.7:2.4.1:014e2254-a853-11e2-81c9-b318c31fa17a #joyent
DatasetStalker  2013-04-16 05:20:27 +0900  New dataset appeared. ubuntu-12.04:2.4.1:da144ada-a558-11e2-8762-538b60994628 #joyent
DatasetStalker  2013-04-13 02:20:10 +0900  New dataset appeared. chefserver:1.1.0:e6f10814-a38d-11e2-8138-67b96e228c1e #joyent  
```

Retrieve mentions

```
$ knife twitter tl -m
sawanoboly  2013-01-31 00:13:03 +0900  http://t.co/n18mSGcA  RT @higanworks: I'm tweeting with @gem!
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
