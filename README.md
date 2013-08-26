# UniqueByDate

A validator for Rails which allows you to validate the uniqueness of an attribute, scoped by a date attribute on the same model. Useful for when your URL's contain a URL slug and a date.


## Installation

Add this line to your application's Gemfile:

    gem 'unique_by_date'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unique_by_date


## Usage

It works just like a normal validator. It has two special parameters (aside from the ones provided by ActiveModel::EachValidator). Both parameters are required:

* `scope` - The date or datetime attribute by which to scope the uniqueness of the attribute being validated. So if you want a `url_slug` attribute to be unique based on a `published_at` timestamp, then you would add `scope: :published_at`.
* `filter` - How the scoped attribute (i.e. `published_at`) should be filtered when validating. If you want every slug to be unique by each month, you would add `filter: :month`. The validator uses [ActiveSupport's Date Calculations](http://apidock.com/rails/ActiveSupport/CoreExtensions/Date/Calculations), so you may use any of those available filters: `:hour, :day, :week, :month, :quarter, :year`.

You should also add a custom message, or add the message to your locales file.
Here's an example:

```ruby
class Event < ActiveRecord::Base
  # Schema:
  # create_table :events do |t|
  #   t.string :title
  #   t.string :url_slug
  #   t.datetime :starts_at
  #   t.datetime :ends_at
  # end
  #
  # Route:
  # get 'events/:year/:month/:day/:slug' => 'events#show'

  validates :slug, unique_by_date: {
    :scope   => :starts_at,
    :filter  => :day,
    :message => "must be unique for each starts_at day."
  }
end
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
