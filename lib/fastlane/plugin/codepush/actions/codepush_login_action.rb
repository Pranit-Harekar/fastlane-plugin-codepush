require 'fastlane/action'
require_relative '../helper/codepush_login_helper'

module Fastlane
  module Actions
    class CodepushLoginAction < Action
      def self.run(params)
        if params[:enforce] == true
          Helper::CodepushLoginHelper.logout
        end

        unless Helper::CodepushLoginHelper.is_logged_in
          if params[:login_token].instance_of?(String)
            Helper::CodepushLoginHelper.login(params[:login_token])
          else
            UI.user_error!('💥Missing login_token param')
            UI.message!('Note: You can either pass login_token or set APP_CENTER_LOGIN_TOKEN environment variable')
          end
        end
      end

      def self.description
        'CodePush login action'
      end

      def self.authors
        ['Pranit Harekar']
      end

      def self.return_value
      end

      def self.details
        'Log in to App Center to access CodePush service. You can pass token via login_token param or set APP_CENTER_LOGIN_TOKEN environment variable. If none were passed your action will be blocked with UI prompt.'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :login_token,
            env_name: 'APP_CENTER_LOGIN_TOKEN',
            description: "App center login token to access CodePush service, optional if ENV['APP_CENTER_LOGIN_TOKEN'] is set",
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :enforce,
            type: TrueClass,
            optional: true,
            default_value: false,
            description: "Enforce logout before login"
          )
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
