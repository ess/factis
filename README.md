# Factis #

Ruby DSL for tracking facts through a test

## So, Uh, Why? ##

There are two sides of this story, really:

* It's generally accepted that being able to track things over the course of an
  indempotent test (a user's email address, the number of stars in the known
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
you tell it to remember and recalls them at your request. There is a generator
to get you up and running with Cucumber, but you should be able to use it with
just about any test framework that allows you to extend the global namespace
(a-la `World(Factis)`).
