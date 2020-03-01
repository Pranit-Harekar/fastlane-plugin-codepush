# Fastlane CodePush plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-codepush)

[📚Documentation](https://pranit-harekar.github.io/fastlane-plugin-codepush)

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

#### 1. `codepush_login`

[Log in to App Center](https://docs.microsoft.com/en-us/appcenter/distribution/codepush/cli#account-management) to access CodePush service.

```ruby
codepush_login
```

| Option      | Description                                                                                         | Environment Variable   | Default |
| ----------- | --------------------------------------------------------------------------------------------------- | ---------------------- | ------- |
| login_token | App center login token to access CodePush service, optional if ENV['APP_CENTER_LOGIN_TOKEN'] is set | APP_CENTER_LOGIN_TOKEN |         |
| enforce     | Enforce logout before login                                                                         |                        | false   |

#### 2. `codepush_logout`

[Log out of App Center](https://docs.microsoft.com/en-us/appcenter/distribution/codepush/cli#account-management)

```ruby
codepush_logout
```

#### 3. `codepush_release_react`

CodePush [release-react](https://docs.microsoft.com/en-us/appcenter/distribution/codepush/cli#releasing-updates-react-native) action

This action lets you release React Native Javascript bundles to a specific CodePush deployment.

```ruby
codepush_release_react(
    app_name: "pharekar/MyAwesomeApp",
    disable_duplicate_release_error: true
)
```

| Option                          | Description                                                                        | Environment Variable | Default |
| ------------------------------- | ---------------------------------------------------------------------------------- | -------------------- | ------- |
| app_name                        | Name of the App Center app, optional if ENV['APP_CENTER_APP_NAME'] is set          | APP_CENTER_APP_NAME  |         |
| execution_dir_path              | Release React CLI command execution dir path                                       |                      | ./      |
| target_binary_version           | Store/binary version of the app you are releasing the update for                   |                      | "\*"    |
| deployment_name                 | Name of your deployment                                                            |                      | Staging |
| output_dir                      | Output directory                                                                   |                      |         |
| sourcemap_output                | Relative path to where the generated JS bundle's source map file should be written |                      |         |
| plist_file_prefix               | File name prefix of the Info.plist file                                            |                      |         |
| plist_file                      | (iOS) Relative path to the Info.plist file                                         |                      |         |
| gradle_file                     | (Android) Relative path to the build.gradle file                                   |                      |         |
| description                     | An optional change log for the deployment                                          |                      |         |
| mandatory                       | Specify whether the update should be considered mandatory or not                   |                      | false   |
| disabled                        | Specify whether the update should be downloadable by end users or not              |                      | false   |
| rollout_percentage              | Percentage of users that should be eligible to receive this update                 |                      |         |
| disable_duplicate_release_error | Specify whether duplicate release error should be disabled or not                  |                      | false   |
| disable_telemetry               | Specify whether telemetry should be disabled or not                                |                      | false   |
| version                         | Version                                                                            |                      |         |
| private_key_path                | Relative path to private key                                                       |                      |         |
| entry_file                      | Relative path to the app's root/entry JavaScript file                              |                      |         |
| development                     | Specify whether to generate an unminified, development JS bundle                   |                      |         |
| bundle_name                     | File name that should be used for the generated JS bundle                          |                      |         |
| dry_run                         | Print the command that would be run, and don't run it                              |                      | false   |

#### 3. `codepush_promote`

CodePush [promote deployment](https://docs.microsoft.com/en-us/appcenter/distribution/codepush/cli#promoting-updates) action

This action lets you promote updates from a source deployment to a destination deployment.

```ruby
codepush_promote(
    app_name: "pharekar/MyAwesomeApp",
    source_deployment_name: "Staging",
    destination_deployment_name: "Production",
)
```

| Option                          | Description                                                               | Environment Variable | Default |
| ------------------------------- | ------------------------------------------------------------------------- | -------------------- | ------- |
| app_name                        | Name of the App Center app, optional if ENV['APP_CENTER_APP_NAME'] is set | APP_CENTER_APP_NAME  |         |
| execution_dir_path              | Promote CLI command execution dir path                                    |                      | ./      |
| target_binary_version           | Store/binary version of the app you are releasing the update for          |                      | "\*"    |
| source_deployment_name          | Source deployment name                                                    |                      |         |
| destination_deployment_name     | Destination deployment name                                               |                      |         |
| description                     | An optional change log for the deployment                                 |                      |         |
| rollout_percentage              | Percentage of users that should be eligible to receive this update        |                      |         |
| disable_duplicate_release_error | Specify whether duplicate release error should be disabled or not         |                      | false   |
| disable_telemetry               | Specify whether telemetry should be disabled or not                       |                      | false   |
| dry_run                         | Print the command that would be run, and don't run it                     |                      | false   |

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
