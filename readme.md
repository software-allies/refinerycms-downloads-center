# Download center extension for Refinery CMS.

## How to build this extension as a gem

    cd vendor/extensions/categories
    gem build refinerycms-categories.gemspec
    gem install refinerycms-categories.gem

## How to install this extension in refinery

add the next line to the Gemfile

    gem 'refinerycms-categories', git: "https://github.com/software-allies/refinerycms-downloads-center.git"

and run the next lines in console

    rails generate refinery:categories
    rake db:migrate
    rake db:seed
    rails s