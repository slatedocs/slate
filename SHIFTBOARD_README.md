### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 2.3.1 or newer**
 - **nokogiri** - install with `sudo gem install nokogiri -v '1.6.8.1' --source 'https://rubygems.org/'`
 - **Bundler** - install with `sudo gem install bundler`

### Getting Set Up

1. Clone the repo to your hard drive with `git clone git@github.com:shiftboard/slate.git`
2. `cd slate`
3. Initialize and start Slate

```shell

bundle install
bundle exec middleman server
```

This will start an http server at http://localhost:4567 which renders
as html the markup
