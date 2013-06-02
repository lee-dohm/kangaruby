# CONTRIBUTING

Great to have you here. Here are a few ways you can help make this project better!

## Team members

* [Lee Dohm](https://github.com/lee-dohm)

## Learn & listen

Start by checking out the [README](README.md) and then take a look at the [Gem documentation](http://rubydoc.info/gems/kangaruby/frames).

## Adding new features

When adding new features it is important for you to follow the standard Github conventions:

1. Fork the project
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

For more detailed instructions, read [this article on Github Help](https://help.github.com/articles/creating-a-pull-request).

## Coding Style

* We use [rubocop](http://batsov.com/rubocop/) to enforce style.  Follow the guidelines it prescribes.
* Include tests with your code!
* Maintain the documentation along with your code.

Don’t get discouraged! We estimate that the response time from the maintainers is around: one week.

## Documentation

We use [YARD][yard] to generate our documentation. We use [Markdown][markdown] for the markup of our documentation. One of the benefits to using YARD over many other documentation tools is that it bends over backwards to make minimal documentation look good. For example, with attributes often just a `@return` tag is sufficient. This does reduce the amount of typing necessary to produce documentation, but we still need to write it. These are our guidelines:

1. All methods **must** have documentation.
1. All classes **must** have documentation.
1. Any monkey patches must use the `@api monkeypatch` tag.
1. All methods must have at least a `@return` tag.
    1. Methods that return a value that is intended to be consumed must have at least a description of what is returned.
    1. Methods that return a value that is not intended to be consumed must have a `@return [void]` tag.
1. All method parameters must be documented.
1. All exceptions raised by a method must be documented with a `@raise` tag. *Exceptions raised by methods called by the method do not have to be documented.*

## Bug triage

* You can help report bugs by filing them here: [New issue](https://github.com/lee-dohm/kangaruby/issues/new)
* You can look through the existing bugs here: [Issues list](https://github.com/lee-dohm/kangaruby/issues)
* Look at existing bugs and help us understand if
    * The bug is reproducible?
    * Is it reproducible in other environments?
    * What are the steps to reproduce?
* You can close fixed bugs by testing old issues to see if they are still reproducible
* You can remove duplicate bug reports

<!--
## Beta testing

This section explains if your project needs beta testing. Explain why early releases require heavy testing and how they can help with specially across browsers and on different hardware.

* For our project you can find the roadmap and features that require testing from here:

## Translations

This section includes any instructions or translation needs your project has.

* You can help us translate our project here:

## Documentation

This section includes any help you need with the documentation and where it can be found. Code needs explanation, and sometimes those who know the code well have trouble explaining it to someone just getting into it.

* Help us with documentation here

## Community

This section includes ideas on how non-developers can help with the project. Here's a few examples:

* You can help us answer questions our users have here:
* You can help build and design our website here:
* You can help write blog posts about the project by:
* You can help with newsletters and internal communications by:

* Create an example of the project in real world by building something or
showing what others have built.
* Write about other people’s projects based on this project. Show how
it’s used in daily life. Take screenshots and make videos!

## Your first bugfix

This section should help a person get started with their very first bug fix and thinking through the problem.
-->

## Other questions?

* If you have further questions, contact: [Lee Dohm](https://github.com/lee-dohm)

[markdown]: http://daringfireball.net/projects/markdown/syntax
[yard]: http://www.yardoc.org
