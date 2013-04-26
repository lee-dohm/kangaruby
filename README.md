[![Build Status](https://travis-ci.org/lee-dohm/kangaruby.png?branch=master)](https://travis-ci.org/lee-dohm/kangaruby)
[![Coverage Status](https://coveralls.io/repos/lee-dohm/kangaruby/badge.png?branch=master)](https://coveralls.io/r/lee-dohm/kangaruby)
[![Code Climate](https://codeclimate.com/github/lee-dohm/kangaruby.png)](https://codeclimate.com/github/lee-dohm/kangaruby)

# KangaRuby

A Ruby implementation of [KangaModeling](http://www.kangamodeling.org), a text-to-graphics converter for UML-like visualizations.

KangaRuby defines a text language that can be used to easily create UML-like [sequence diagrams](http://en.wikipedia.org/wiki/Sequence_diagram).  It is meant to make modeling a process very simple and to easily turn the text into a professional-quality image without the need for a large and/or expensive piece of software.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kangaruby'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install kangaruby
```

## Usage

Once you have the gem installed, you should be able to take a valid KangaRuby language text file and perform the following actions to turn it into an image:

```ruby
require 'kangaruby'

KangaRuby.convert(path_to_text, path_to_image)
```

If `path_to_image` does not end with a `.svg` extension, one will be appended to the supplied path.

### Language

The [KangaRuby language](documentation/Language.md) is based on the language described by [KangaModeling](http://www.kangamodeling.org) and [Web Sequence Diagrams](http://www.websequencediagrams.com) with some modifications to make it parsable by standard tools.  The language consists of *participants* and *actions*.  A participant is simply a string of text.  An action is described by one of two types of arrows.  For example:

```text
Alice->Bob
Bob-->Alice
```

This describes two participants, [Alice and Bob](http://en.wikipedia.org/wiki/Alice_and_Bob), and two actions, one from Alice to Bob and the other from Bob to Alice.

## Development

To see what has changed in recent versions of KangaRuby, see the [CHANGELOG](CHANGELOG.md).

## Core Team Members

* [Lee Dohm](https://github.com/lee-dohm)

## Copyright

Copyright &copy; 2013 [Lee Dohm](https://github.com/lee-dohm), [Lifted Studios](https://github.com/lifted-studios).  See [LICENSE](LICENSE.md) for details.
