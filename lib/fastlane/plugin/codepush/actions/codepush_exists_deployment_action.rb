require 'fastlane/action'

module Fastlane
  module Actions
    class CodepushExistsDeploymentAction < Action
      def self.run(params)
        Dir.chdir(params[:execution_dir_path].to_s) do
          command = "appcenter codepush deployment list "
          ## params
          command += "-a #{params[:app_name]}"

          if params[:dry_run]
            UI.message('Dry run!'.red + ' Would have run: ' + command + "\n")
          else
            return sh(command.to_s).include?(params[:deployment_name])
          end
        end
      end

      def self.description
        'CodePush check if deployment exists'
      end

      def self.authors
        ['Pranit Harekar']
      end

      def self.return_value
        'Returns boolean value indicating whether deployment exists or not'
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
            key: :dry_run,
            description: "Print the command that would be run, and don't run it",
            is_string: false,
            default_value: false
          ),
          FastlaneCore::ConfigItem.new(
            key: :deployment_name,
            description: 'Deployment name',
            optional: false,
            type: String
          )
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
