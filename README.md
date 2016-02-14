# sprout-homebrew cookbook

[![Build Status](https://travis-ci.org/pivotal-sprout/sprout-homebrew.png?branch=master)](https://travis-ci.org/pivotal-sprout/sprout-homebrew)

A Chef cookbook to manage automatic startup of homebrew [formulas](https://github.com/mxcl/homebrew/tree/master/Library/Formula).

## Deprecation Notice

sprout-homebrew is mostly deprecated in favor of Chef's default [homebrew cookbook](https://github.com/chef-cookbooks/homebrew), and is only useful for managing package automatic startup with launchctl. If you need to install homebrew, formulas, or casks, please use that cookbook instead. If needed, [sprout-homebrew 0.3.0](https://github.com/pivotal-sprout/sprout-homebrew/commit/68274f5f450a1cf1b0ae6748e4c4606d1ce47e87) is available, but keep in mind that it may not work as expected.

To migrate from sprout-homebrew to homebrew, you can do the following:

- sprout-homebrew::formulae &mdash; Use homebrew::install_formulas and move `node_attributes.sprout.homebrew.formulae` to `node_attributes.homebrew.formulas`.
- sprout-homebrew::casks &mdash; Use homebrew::install_casks and move `node_attributes.sprout.homebrew.casks` to `node_attributes.homebrew.casks`.

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

* `launchctl` &mdash; The list of packages to automatically start (managed by
   launchctl). Each package is a key value e.g. `tor: load` where the value is
   one of:
   - `load` &mdash; Start the package at system start, and launch immediately
   - `unload` &mdash; Do not start the package at system start, and stop if currently running
   - `reload` &mdash; Reload a package already set to start at system start

### Recipes

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

