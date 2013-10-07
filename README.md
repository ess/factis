## Factis ##

Ruby DSL for safely tracking facts through a test

## Gem Setup ##

```ruby
gem install factis

# Gemfile
group :test do
  gem 'factis'
end
```
## Using with Rails ##

```bash
rails generate factis:install
```

Truth be told, this just installs some example Factis steps and a support file
for Cucumber. For the time being, it's on you to figure out how to use it with
other testing frameworks.

### factis_steps.rb ###

Much like our once beloved web_steps.rb, you should read factis_steps.rb exactly
one time, and then you should delete it. It's really just an example, and using
those steps in a feature will make your stakeholders hate you with the fury of
a thousand burning suns.

## Cucumber ##

So, using Cucumber, but not Rails? Try this!

```ruby
# features/support/factis.env
require 'factis/cucumber'
```

This gets you ready to use the DSL. Additionally, it forces Factis to forget
everything that you have told it to memorize after each scenario. Because stale
state information from one scenario to the next will make you a very sad panda.

## How Do I Use This Thing? ##

When I'm tracking state within a test, it's most likely a Cucumber feature.
That being the case, I'm going to use terminology from that side of the
experience. Here's everything that World gets when you use Factis.

```ruby
# Let's memorize that my brother, Joe, just loves pie.
memorize_fact("What does Joe love?", "Joe loves pie.")
  => "Joe loves pie."

# Hey Factis, what does Joe love?
recall_fact("What does Joe love?")
  => "Joe loves pie."

# That's not very interesting. Let's forget about it.
forget_fact("What does Joe love?")
  => "Joe loves pie."

# Wait, what does Joe love again?
recall_fact("What does Joe love?")
  => Trying to recall an unknown fact: 'What does Joe love?' (RuntimeError)

# Just to make sure it's really forgotten ...
forget_fact("What does Joe love?")
  => Trying to forget an unknown fact: 'What does Joe love?' (RuntimeError)

# Let's just forget everything.
clear_all_facts!

# So, what facts do we know?
all_facts
  => {}

class Foo
end

# The content can be pretty much anything.
memorize_fact(:some_foo, Foo.new)
  => #<Foo:0x007ffd84394728>

# What's a foo?
recall_fact(:some_foo)
  => #<Foo:0x007ffd84394728>
```

## Contributing ##

Do you use git-flow? I sure do. Please base anything you do off of
[the develop branch](https://github.com/ess/factis/tree/develop).

1. Fork it.
2. Perform some BDD magic. Seriously. Be testing.
3. Submit a pull request.

## So, Uh, Why? ##

There are two sides of this story, really:

* It's generally accepted that being able to track things over the course of an
  idempotent test (a user's email address, the number of stars in the known
  galaxy, etc) makes it easier to write tests. Rather than thinking "my email
  address is user@example.com" repeatedly, you can just accept that you have
  an email address.

* It's generally accepted that tracking things with instance variables over the
  course of a test is a pretty bad scene. On top of generally muddying up the
  object space, it makes it really easy to rely on state that's left over from
  a previously-run scenario, forget to set them up in the first place, etc.

I've run into a lot of problems with tracking state in my tests in unsafe ways,
so this thing got thrown together.

## Okay, So What's So Great About It? ##

Not much, really. It's really just a simple DSL that hides away the things that
you tell it to memorize and recalls them at your request. There is a generator
to get you up and running with Cucumber, but you should be able to use it with
just about any test framework that allows you to extend the global namespace
(a-la `World(Factis)`).

## License ##

MIT License. Copyright 2013 Ess
