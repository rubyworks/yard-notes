# YARD Notes

[Hompage](http://rubyworks.github.com/yard-notes) /
[Report Issue](http://github.com/rubyworks/yard-notes/issues) /
[Source Code](http://githubc.com/rubyworks/yard-notes)
[Mailing List](http://groups.google.com/groups/rubyworks-mailinglist) /
[IRC Chat](irc://chat.us.freenode.net/rubyworks)


## Description

YARD likes to inform us of every line in every file where
a tag is used that hasn't been explicitly informed shoud
exist. The way I figure it, if I used it, it should exist.
However, that doesn't mean I neccessiarily want all tags to
show up in the docs, so this plugin keeps YARD from making
a ruckess about tags in ALL CAPS, keeps such tags out of the
docs, and adds them to a specia NOTES pages where they can
be reviewed. This is a great way to make development notes
in your code.


## Instruction

Use yard as usual but add the `--plugin notes` command line
option.

    $ yard --plugin ntoes ...


## Installation

Using RubyGems to install:

    $ gem install yard-shutup


## Copyright & License

(MIT License)

Copyright (c) 2011 Rubyworks.

YARD Notes is distributable under the terms of the **MIT** license.

See License.txt for details.

