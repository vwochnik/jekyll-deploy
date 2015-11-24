# Jekyll Deploy [![Gem Version](https://badge.fury.io/rb/jekyll-deploy.png)](http://badge.fury.io/rb/jekyll-deploy)

> Jekyll 3.0-compatible deploy plugin

Jekyll Deploy is a Jekyll plugin which adds a `deploy` sub-command to the `jekyll` executable which allows deploy commands to be executed quickly.

## Installation

This plugin is available as a [RubyGem][ruby-gem].

Add this line to your application's `Gemfile`:

```
group :jekyll_plugins do
  gem 'jekyll-deploy'
end
```

And then execute the `bundle` command to install the gem.

After the plugin has been installed successfully, the `deploy` sub-command is available for use.

# Configuration

The `deploy` command executes all commands specified in the `deploy` array inside the site's configuration file as the following example demonstrates:

```
deploy:
- rsync -aze ssh --delete ./ example.com:www/                
```

All commands are executed within the site's destination directory which is, by default, `_site` but can be changed with the `destination` configuration option.

The `deploy` command supports the built-in `--config`, `--destination` and `--verbose` command line options.

# Contribute

Fork this repository, make your changes and then issue a pull request. If you find bugs or have new ideas that you do not want to implement yourself, file a bug report.

# Copyright

Copyright (c) 2015 Vincent Wochnik.

License: MIT

[ruby-gem]: https://rubygems.org/gems/jekyll-deploy
