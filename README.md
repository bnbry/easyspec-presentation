# RSpec from Scratch

## Episode 1

The primary goal is to start demystifying the RSpec domain specific language(a language on top of an existing language crafted for a specific use case, like writing specifications, or defining routing for a web app ie: Rails routing files) by actually constructing an approximation of it from scratch

I also want to explain the conceptual differences between specifications and xunit style tests and how ultimately they are both just making assertions

We'll go from print debugging to building a lightweight version of RSpec expectations and matchers and reveal the underlying structure of the expect syntax to make it easier to reason about when writing specs.

Then we'll look at sharing setup between specs by implementing basic versions of let and lifecycle hooks and try to clarify why they exist and what value they are providing.

We'll try to walk through all of this with the minimal amount of code necessary to understand conceptually how these work but this isn't a precise implementation, the actual RSpec library accounts for a lot more functionality and edge cases and uses a more robust and proven implementation.

## Episode 2

TBD

* mocks
* specs

## Episode 3

TBD

* Testing approaches in depth

## Resources

### Websites

* BetterSpecs - https://www.betterspecs.org/
* RSpec Docs - https://rspec.info/
* RSpec Libs - https://github.com/rspec
* Thoughtbot Testing - https://thoughtbot.com/upcase/testing

### Presentations

* The Magic Tricks of Testing - Metz - https://www.youtube.com/watch?v=URSWYvyc42M
* Why You Don't Get Mock Objects - Moeck - https://www.youtube.com/watch?v=R9FOchgTtLM
* How to Stop Hating Your Test Suite - Searls - https://www.youtube.com/watch?v=VD51AkG8EZw
* Breaking up (with) your Test Suite - Searls - https://www.youtube.com/watch?v=9_3RsSvgRd4
* Happier TD - Searls - https://www.youtube.com/watch?v=nH8EnmdEBj4
* How RSpec Works - Phippen - https://www.youtube.com/watch?v=B8yKlTNlY5E

### Books

* Effective Testing with RSpec 3 - Marston/Dees - https://pragprog.com/titles/rspec3/effective-testing-with-rspec-3/
* Growing Object-Oriented Software Guided by Tests - Freeman/Pryce - http://www.growing-object-oriented-software.com/
* Rails 5 Test Prescriptions - Rappin - https://pragprog.com/titles/nrtest3/rails-5-test-prescriptions/
