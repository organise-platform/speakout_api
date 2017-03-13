# SpeakoutApi

Does what it says on the tin. Currently supported are Campaigns and Surveys.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'speakout_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install speakout_api

## Usage

Create a new Speakout API instance using the domain of your Speakout installation. E.g. https://my-speakout.herokuapp.com and an account username and password.

`speakout = Speakout::API.new(host, username, password)`

### Campaigns

```ruby
new_campaign = speakout.campaigns.create({name: "Hello", internal_name: "TEST campaign 1"})
new_campaign.update_attributes(actions: 'sign,donate,share')
new_campaign.update_attributes(sign_advice: "Sign the petition because it's important!", donate_advice: "Now donate please")
```

```ruby
campaign = speakout.campaigns.find_by_id(1)
campaign.attributes #=> {id: 1, name: "Hello", ....}
```

### Surveys

TODO Write Description

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jamesr2323/speakout_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

