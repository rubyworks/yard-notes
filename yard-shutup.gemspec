--- !ruby/object:Gem::Specification 
name: yard-shutup
version: !ruby/object:Gem::Version 
  prerelease: 
  version: 0.0.1
platform: ruby
authors: []

autorequire: 
bindir: bin
cert_chain: []

date: 2011-06-11 00:00:00 Z
dependencies: 
- !ruby/object:Gem::Dependency 
  name: yard
  prerelease: false
  requirement: &id001 !ruby/object:Gem::Requirement 
    none: false
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
  type: :runtime
  version_requirements: *id001
description: If I want to know about the tags that aren't defined I will ask. So YARD, shut up!
email: transfire@gmail.com
executables: []

extensions: []

extra_rdoc_files: 
- README.md
files: 
- Profile
- site
- site/doc
- site/doc/top-level-namespace.html
- site/doc/YARD.html
- site/doc/js
- site/doc/js/app.js
- site/doc/js/full_list.js
- site/doc/js/jquery.js
- site/doc/YARD
- site/doc/YARD/Docstring.html
- site/doc/YARD/DocString.html
- site/doc/frames.html
- site/doc/_index.html
- site/doc/class_list.html
- site/doc/method_list.html
- site/doc/index.html
- site/doc/css
- site/doc/css/full_list.css
- site/doc/css/common.css
- site/doc/css/style.css
- site/doc/file.README.html
- site/doc/file_list.html
- README.md
- lib
- lib/yard-shutup.rb
- Version
homepage: http://rubyworks.github.com/yard-shutup
licenses: []

post_install_message: 
rdoc_options: 
- --title
- YARD ShutUp! API
- --main
- README.md
require_paths: 
- lib
required_ruby_version: !ruby/object:Gem::Requirement 
  none: false
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
required_rubygems_version: !ruby/object:Gem::Requirement 
  none: false
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
requirements: []

rubyforge_project: yard-shutup
rubygems_version: 1.8.2
signing_key: 
specification_version: 3
summary: Because some tags are for devops eyes only.
test_files: []

