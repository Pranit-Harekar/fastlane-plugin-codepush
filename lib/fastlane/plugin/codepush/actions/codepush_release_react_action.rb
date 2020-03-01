require 'fastlane/action'

module Fastlane
  module Actions
    class CodepushReleaseReactAction < Action
      def self.run(params)
        Dir.chdir(params[:execution_dir_path].to_s) do
          command = "appcenter codepush release-react "

          ## params
          command += "-a #{params[:app_name]} "
          command += "-t #{params[:target_binary_version]} " if params[:target_binary_version]
          command += "-d #{params[:deployment_name]} " if params[:deployment_name]
          command += "-o #{params[:output_dir]} " if params[:output_dir]
          command += "-s #{params[:sourcemap_output]} " if params[:sourcemap_output]
          command += "--plist-file-prefix #{params[:plist_file_prefix]} " if params[:plist_file_prefix]
          command += "-p #{params[:plist_file]} " if params[:plist_file]
          command += "-g #{params[:gradle_file]} " if params[:gradle_file]
          command += "--description #{params[:description]} " if params[:description]
          command += '-m ' if params[:mandatory]
          command += '-x ' if params[:disabled]
          command += "-r #{params[:rollout_percentage]} " if params[:rollout_percentage]
          command += '--disable-duplicate-release-error ' if params[:disable_duplicate_release_error]
          command += '--disable-telemetry ' if params[:disable_telemetry]
          command += "-v #{params[:version]} " if params[:version]
          command += "-k #{params[:private_key_path]} " if params[:private_key_path]
          command += "-e #{params[:entry_file]} " if params[:entry_file]
          command += "--development " if params[:development]
          command += "-b #{params[:bundle_name]} " if params[:bundle_name]

          if params[:dry_run]
            UI.message('Dry run!'.red + ' Would have run: ' + command + "\n")
          else
            sh(command.to_s)
          end
        end
      end

      def self.description
        'CodePush release-react action'
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
            description: 'Release React CLI command execution dir path',
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
            key: :deployment_name,
            description: 'Deployment name',
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :output_dir,
            description: 'Output directory',
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :sourcemap_output,
            description: "Relative path to where the generated JS bundle's source map file should be written",
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :plist_file_prefix,
            description: "File name prefix of the Info.plist file",
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :plist_file,
            description: "Relative path to the Info.plist file",
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :gradle_file,
            description: "Relative path to the build.gradle file",
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :description,
            description: "An optional change log for the deployment",
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :mandatory,
            description: "Specify whether the update should be considered mandatory or not",
            optional: true,
            is_string: false,
            default_value: false
          ),
          FastlaneCore::ConfigItem.new(
            key: :disabled,
            description: "Specify whether the update should be downloadable by end users or not",
            optional: true,
            is_string: false,
            default_value: false
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
            key: :version,
            description: "version",
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :private_key_path,
            description: "Relative path to private key",
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :entry_file,
            description: "Relative path to the app's root/entry JavaScript file",
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :development,
            description: "Specify whether to generate an unminified, development JS bundle",
            optional: true,
            is_string: false,
            default_value: false
          ),
          FastlaneCore::ConfigItem.new(
            key: :bundle_name,
            description: "File name that should be used for the generated JS bundle",
            optional: true,
            type: String
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
        [:ios, :android].include?(platform)
      end
    end
  end
end
