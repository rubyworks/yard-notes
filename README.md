# YARD Notes

[Hompage](http://rubyworks.github.com/yard-notes) /
[Source Code])http://githubc.com/rubyworks/yard-notes)


## Description

YARD likes to inform us of every line in every file where
a tag is used it hasn't been explicitly informed shoud
exist. The way I figure it, if I used it, it should exist.
However, that doesn't mean I neccessiarily want it to
show up in the docs, so this plugin keeps YARD from making
a ruckess but also keeps such tags out of the docs.

While not yet implemented, the plan is have yard present
one line of info about the number of undefined tags were
processed and add a command line option to dump them
out in detail if so desired.


## Instruction

    $ yard --plugin shutup ...


## Installation

Using RubyGems:

    $ gem install yard-shutup


## Copyright & License

(MIT License)

Copyright (c) 2011 Rubyworks.

YARD Notes is distributable under the terms of the **MIT** license.

See License.txt for details.

