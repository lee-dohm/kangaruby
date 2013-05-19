[![Build Status](https://travis-ci.org/lee-dohm/kangaruby.png?branch=master)](https://travis-ci.org/lee-dohm/kangaruby)
[![Coverage Status](https://coveralls.io/repos/lee-dohm/kangaruby/badge.png?branch=master)](https://coveralls.io/r/lee-dohm/kangaruby)
[![Code Climate](https://codeclimate.com/github/lee-dohm/kangaruby.png)](https://codeclimate.com/github/lee-dohm/kangaruby)

# KangaRuby

A Ruby implementation of [KangaModeling](http://www.kangamodeling.org), a text-to-graphics converter for UML-like visualizations.

## Introduction

KangaRuby defines a text language that can be used to easily create UML-like [sequence diagrams](http://en.wikipedia.org/wiki/Sequence_diagram).  It is meant to make modeling a process very simple and to easily turn the text into a professional-quality image without the need for a large and/or expensive piece of software.

KangaRuby writes all of its output in [SVG](http://en.wikipedia.org/wiki/Scalable_Vector_Graphics) format.  The kind of images that KangaRuby creates is exactly the kind of image for which SVG was created.  This allows the image to be easily scaled to any size and still maintain fidelity.  If one wishes to have a raster image, such as a [PNG](http://en.wikipedia.org/wiki/Portable_Network_Graphics) or [JPG](http://en.wikipedia.org/wiki/JPEG), there are tools available that can perform the conversion after the fact.

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

Once you have the gem installed, you should be able to take a valid KangaRuby language text file and perform the following actions to turn it into an SVG image:

```ruby
require 'kangaruby'

svg = KangaRuby.convert(path_to_text)
```

`convert` will simply return a `String` containing the SVG XML.

### Language

The [KangaRuby language](documentation/Language.md) is based on the language described by [KangaModeling](http://www.kangamodeling.org) and [Web Sequence Diagrams](http://www.websequencediagrams.com) with some modifications to make it parsable by standard tools.  The language consists of *participants* and *actions*.  A participant is simply a string of text.  An action is described by one of two types of arrows.  For example:

```text
Alice->Bob
Bob-->Alice
```

This describes two participants, [Alice and Bob](http://en.wikipedia.org/wiki/Alice_and_Bob), and two actions, one from Alice to Bob and the other from Bob to Alice.

TODO: Add image link

For a full description of the KangaRuby language, see the [language documentation](documentation/Language.md).

## Development

To see what has changed in recent versions of KangaRuby, see the [CHANGELOG](CHANGELOG.md).

## Core Team Members

* [Lee Dohm](https://github.com/lee-dohm)

## Copyright

The "Abscissa" font family is Copyright (c) 1998-2013 [1001 Free Fonts](http://www.1001freefonts.com). All Rights Reserved.

All else is Copyright &copy; 2013 [Lee Dohm](https://github.com/lee-dohm), [Lifted Studios](https://github.com/lifted-studios).  See [LICENSE](LICENSE.md) for details.
