# YARD Notes

[Hompage](http://rubyworks.github.com/yard-notes) /
[Report Issue](http://github.com/rubyworks/yard-notes/issues) /
[Source Code](http://github.com/rubyworks/yard-notes) /
[Mailing List](http://groups.google.com/groups/rubyworks-mailinglist) /
[IRC Chat](irc://chat.us.freenode.net/rubyworks)


## Description

YARD informs us of every line in every file where a tag is used
that hasn't been explicitly defined. But as a programmer, if I
used it, the it should exist. However, that doesn't mean we
neccessiarily want all tags to show up in the docs, so this
plugin keeps YARD from making a ruckess about tags that are 
in ALL CAPS, keeps such tags out of the docs, and adds them
to a special NOTES pages where they can be reviewed. This is
a great way to make development notes in your code.


## Instruction

Add ALL-CAPS tags to your doumentation. For example:


    @TODO Need to refactor this code.
    def some_method
       . . .
    end


The use yard as usual but add the `--plugin notes` command line
option.

    $ yard --plugin notes ...


## Installation

Using RubyGems to install:

    $ gem install yard-notes


## Copyright & License

(MIT License)

Copyright (c) 2011 Rubyworks.

YARD Notes is distributable under the terms of the **MIT** license.

See License.txt for details.

