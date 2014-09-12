# Assorted

[![Build Status](https://travis-ci.org/dribbble/assorted.svg)](https://travis-ci.org/dribbble/assorted)
[![Code Climate](https://codeclimate.com/github/dribbble/assorted/badges/gpa.svg)](https://codeclimate.com/github/dribbble/assorted)

Assorted is a tiny gem adding some convenience to your ActiveRecord objects with `asc` and `desc` scopes to sort your queries. By default these sort by `created_at`, but you can sort by whichever colum makes sense for your needs. See [Usage](#usage) below for more details.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'assorted'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install assorted

## Usage

By default, `asc` and `desc` sort by `created_at`.

```ruby
SomeModel.asc  # equivalent to SomeModel.sort("created_at asc")
SomeModel.desc # equivalent to SomeModel.sort("created_at desc")
```

You can change this per query, by passing an alternate column.

```ruby
SomeModel.asc(:updated_at)  # equivalent to SomeModel.sort("updated_at asc")
SomeModel.desc(:updated_at) # equivalent to SomeModel.sort("updated_at desc")
```

To change the default sort column for a given class, specify with `set_sorting_column`.

```ruby
class SomeModel
  set_sorting_column "average_score"
end

SomeModel.asc  # equivalent to SomeModel.sort("average_score asc")
SomeModel.desc # equivalent to SomeModel.sort("average_score desc")
```

## Contributing

1. Fork it ( https://github.com/dribbble/assorted/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
