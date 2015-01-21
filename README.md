# ActsAsPercentage
A handy ruby concern to make percentages easier in models and forms

### About This

This is a very simple set of generic functions generators that unify how I think
about percentages. In short, when a percentage is displayed in a view I like to
think about it from 0 to 100. For example, twenty two and a half percent would
be `22.5`. When I use that same number in a calculation, it's
convenient to have it as a number from 0 to 1. For example, twenty two and a
half percent would be `0.225`. To solve this, I made generic getters and
setters.

### Using It

With the concern, define the methods that you want to act as a percentage.
Usually, it's a float field in the database but it doesn't half to be.

```ruby
  class GenericFinanceStuff < ActiveRecord::Base
    include ActsAsPercentage

    ...

    acts_as_percentage_on :credit_card_rate, :other_float_method

    ...

  end
```

Then in the view, you can use the getters and setters that were made from the
concern to easily work with the variables.

Check out the example in the app director for richer code snippets.


### Instalation

This is not a gem. Just copy the concern in `/app/model/concerns` into your ruby
concerns and go to town. There are matching rspec tests and a generic example
of how I've used it.

### Help

Feel free to email me with questions or send a pull request with answers.
