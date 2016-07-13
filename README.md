# Aktibibo

Aktibibo is a simple gem that allows an ActiveRecord model instance to be set as active, inactive or deactivated using convenience methods.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aktibibo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aktibibo

## Setup

1. Create the necessary columns using a migration:
    ```
    rails generate migration add_activated_at_to_foo activated_at:datetime
    rails generate migration add_deactivated_at_to_foo deactivated_at:datetime
    ```
2. Define that your model is "activatable":

    ```ruby
    class Foo < ActiveRecord::Base
      activatable
    end
    ```
## Usage

Let's say that an instance `foo` is available.
### Methods to activate and deactivate
```ruby
foo.activate
foo.deactivate
```
Non-bang methods will just return nil (gracefully) if an already active instance is activated. Same goes for deactivate.

### Methods that set but with a bang!
```ruby
foo.activate!
foo.deactivate!
```
Bang methods, on the other hand, will raise `AktibiboError` if activated while active or deactivated while deactivated/inactive.

### Boolean methods
```ruby
foo.active? 
foo.deactivated?
foo.inactive?
```

### Scopes are provided for easy filtering
```ruby
Foo.inactive # Returns all the inactive foos
Foo.activated # Returns all the active foos
Foo.deactivated # Returns all the deactivated foos
```

### Activation and deactivation times are also accessible.
```ruby
foo.activated_at  # Fri, 29 Apr 2016 08:29:03 UTC +00:00
foo.deactivated_at # nil
```
## Development
TODO: Add args to set from the model if re-activation is allowed.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/katpadi/aktibibo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

