# sprout-homebrew cookbook

[![Build Status](https://travis-ci.org/pivotal-sprout/sprout-homebrew.png?branch=master)](https://travis-ci.org/pivotal-sprout/sprout-homebrew)

A Chef cookbook to install Homebrew [formulae](https://github.com/mxcl/homebrew/tree/master/Library/Formula) for packages and [casks](https://github.com/phinze/homebrew-cask/blob/master/USAGE.md) for applications.

## Usage

### Prerequisites

- [system ruby](.ruby-version)
- [bundler](http://bundler.io)

### Quickstart

```
bundle
bundle exec soloist
```

## Cookbook Usage

### Attributes


*NOTE:* All preferences are namespaced under `sprout => homebrew` they include:

* `formulae` &mdash; The list of brew packages to install
  - To install the formula at the HEAD revision (rather than stable), use a hash with the following keys:
    - `name` &mdash; The name of the package
    - `head` &mdash; Set to `true`
* `casks` &mdash; The list of casks to install
* `launchctl` &mdash; The list of packages to automatically start (managed by
   launchctl). Each package is a key value e.g. `tor: load` where the value is
   one of:
   - `load` &mdash; Start the package at system start, and launch immediately
   - `unload` &mdash; Do not start the package at system start, and stop if currently running
   - `reload` &mdash; Reload a package already set to start at system start

### Recipes

1. `sprout-homebrew`
1. `sprout-homebrew::formulae`
1. `sprout-homebrew::casks`
1. `sprout-homebrew::casks`
1. `sprout-homebrew::launchctl`

## Contributing

### Before committing

```
bundle
bundle exec rake
```

The default rake task includes rubocop, foodcritic, unit specs

### [Rubocop](https://github.com/bbatsov/rubocop)

```
bundle
bundle exec rake rubocop
```

### [FoodCritic](http://acrmp.github.io/foodcritic/)

```
bundle
bundle exec rake foodcritic
```

### Unit specs

Unit specs use [ServerSpec](http://serverspec.org/)

```
bundle
bundle exec rake spec:unit
```

### Integration specs

Integrations specs will run the default recipe on the host system (destructive) and make assertions on the system after
install.

```
bundle
bundle exec rake spec:integration
```

