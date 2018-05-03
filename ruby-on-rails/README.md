Assumption is that a recent/current version of Ruby on Rails is installed. To install:

    $ brew install rbenv ruby-build
    $ rbenv install 2.5.0
    $ sudo gem install rails -v 5.1.4

If your experience is like mine just now (May 2, 2018), this’ll probably get you Ruby 2.3.3 and Rails 5.1.6

Before running benchmark for the first time, you might need to prime the gem pump:

    $ cd ruby-on-rails
    $ rails server
    ^C

