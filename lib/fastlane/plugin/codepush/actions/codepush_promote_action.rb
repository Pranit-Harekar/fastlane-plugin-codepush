require 'fastlane/action'

module Fastlane
  module Actions
    class CodepushPromoteAction < Action
      def self.run(params)
        Dir.chdir(params[:execution_dir_path].to_s) do
          command = "appcenter codepush promote "

          ## params
          command += "-a #{params[:app_name]} "
          command += "-t #{params[:target_binary_version]} " if params[:target_binary_version]
          command += "-s #{params[:source_deployment_name]} " if params[:source_deployment_name]
          command += "-d #{params[:destination_deployment_name]} " if params[:destination_deployment_name]
          command += "-r #{params[:rollout_percentage]} " if params[:rollout_percentage]
          command += '--disable-duplicate-release-error ' if params[:disable_duplicate_release_error]
          command += '--disable-telemetry ' if params[:disable_telemetry]
          command += "--description #{params[:description]} " if params[:description]

          if params[:dry_run]
            UI.message('Dry run!'.red + ' Would have run: ' + command + "\n")
          else
            sh(command.to_s)
          end
        end
      end

      def self.description
        'CodePush promote action'
      end

      def self.authors
        ['Pranit Harekar']
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :app_name,
            env_name: "APP_CENTER_APP_NAME",
            description: "Name of the App Center app, optional if ENV['APP_CENTER_APP_NAME'] is set",
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :execution_dir_path,
            description: 'Promote CLI command execution dir path',
            optional: true,
            type: String,
            default_value: "./"
          ),
          FastlaneCore::ConfigItem.new(
            key: :target_binary_version,
            description: 'Store/binary version of the app you are releasing the update for',
            optional: true,
            type: String,
            default_value: "\"*\""
          ),
          FastlaneCore::ConfigItem.new(
            key: :source_deployment_name,
            description: 'Source deployment name',
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :destination_deployment_name,
            description: 'Destination deployment name',
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :description,
            description: "An optional change log for the deployment",
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :rollout_percentage,
            description: "Percentage of users that should be eligible to receive this update",
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :disable_duplicate_release_error,
            description: "Specify whether duplicate release error should be disabled or not",
            optional: true,
            is_string: false,
            default_value: false
          ),
          FastlaneCore::ConfigItem.new(
            key: :disable_telemetry,
            description: "Specify whether telemetry should be disabled or not",
            optional: true,
            is_string: false,
            default_value: false
          ),
          FastlaneCore::ConfigItem.new(
            key: :dry_run,
            description: "Print the command that would be run, and don't run it",
            is_string: false,
            default_value: false
          )
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
