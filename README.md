# SecureRandom

Cryptographically Secure Pseudo Random Number Generator (CSPRNG).

This gem is intended for generating cryptographically secure pseudo random number
without worring the system's entropy consumption.
You can use this library for almost all use of random numbers including generating
session keys.

If you want a PRNG for Monte Carlo simulations, Random (which uses MT19937) or
other non cryptographically secure generators are fast.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'securerandom'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install securerandom

## Usage

```ruby
p SecureRandom.gen_random(32)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nurse/securerandom.


## License

The gem is available as open source under the terms of the [2-clause BSD License](https://github.com/nurse/securerandom/blob/master/LICENSE.txt).

