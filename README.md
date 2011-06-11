# YARD ShutUp!

Author:: Thomas Sawyer
License:: MIT
Copyright:: (c) 2011 Rubyworks, Thomas Sawyer


## Description

YARD likes to inform us of every line in every file where
a tag is used it hasn't been explicitly informed shoud
exist. The way I figure it, if I used it it should exist.
However, that doesn't mean I neccessiarily want it to
show up in the docs, so this plugin keeps YARD from making
a ruckess but also keeps such tags out of the docs.

While not yet implemented, the plan is have yard present
one line of info about the number of undefined tags were
processed and add a command line option to dump them
out in detail if so desired.


## Resources

[Hompage](http://rubyworks.github.com/yard-shutup)
[Source Code](http://githubc.com/rubyworks/yard-shutup)


## Usage

    $ yard --plugin shutup ...


## Install

### RubyGems

    $ gem install yard-shutup


## Copyright & Licensing

(MIT License)

Copyright (c) 2011 Thomas Sawyer

See NOTICE.md and MIT.txt for details.

