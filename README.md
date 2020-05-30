# Fastlane CodePush plugin

[![Build Status](https://travis-ci.com/Pranit-Harekar/fastlane-plugin-codepush.svg?branch=master)](https://travis-ci.com/Pranit-Harekar/fastlane-plugin-codepush)
[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-codepush)

[📚Documentation](https://github.com/Pranit-Harekar/fastlane-plugin-codepush/wiki)

## Prerequisites

Install the [App Center CLI](https://docs.microsoft.com/en-us/appcenter/distribution/codepush/cli#installation)

```
npm install -g appcenter-cli
```

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-codepush`, add it to your project by running:

```bash
fastlane add_plugin codepush
```

## About codepush

This is a Fastlane plugin for App Center CodePush service.

### List of available actions

[Checkout docs](https://github.com/Pranit-Harekar/fastlane-plugin-codepush/wiki)

## Example

Check out the [example `Fastfile`](examples/ReactNative/fastlane/Fastfile) to see how to use this plugin.

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use

```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository. Feel free to submit pull requests and improve test coverage.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).

## Why this plugin?

- [fastlane-plugin-appcenter](https://github.com/microsoft/fastlane-plugin-appcenter) does not support CodePush
- [Fastfastlane-plugin-code_pushlane](https://github.com/manuelkch/fastlane-plugin-code_push) is outdated & does not support App Center CLI
