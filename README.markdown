# Stembolt Rails Starter Template

This project is meant to simplify the process of starting a new Rails app by
providing a sane Rails application template. It includes some of the gems and
configuration we've found essential.

Generating a new Rails application using this template will add and commit to git
* a Gemfile
* spec and feature helper
* home controller and route

## What do I get?

### Gemfile

* rspec-rails
* factory_girl_rails
* capybara
* poltergeist
* database_cleaner

## Usage

Download it, then use it with your favourite other options. These are ours

```shell
$ rails new app_name \
  -C --skip-spring \
  --skip-turbolinks --skip-test \
  -d postgresql \
  -m ../path/to/rails-starer-template/wizardry.rb
```
