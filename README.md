Rails Template Coverage
=======================

Simple gem to run your functional tests & tell you which templates weren't
covered in the controllers tested by your tests.

In your Gemfile
===============

    gem 'rails_template_coverage', '~> 1.0', :git => 'git@github.com:tiegz/rails_template_coverage.git'

Usage
=====

    bundle exec rake test:functionals_and_templates

Output
======

    ---------------------------------------
    Templates not used in functional suite:
    ---------------------------------------
      /PathToYourcode/app/views/posts
      /PathToYourcode/app/views/posts/_show.haml
      /PathToYourcode/app/views/posts/_show.js.erb
    ---------------------------------------
    Total: 3 out of 1032
    ---------------------------------------

License
-------

Rails Template Coverage is Copyright © 2012 Tieg Zaharia. It is free software, 
and may be redistributed under the terms specified in the MIT-LICENSE file.
