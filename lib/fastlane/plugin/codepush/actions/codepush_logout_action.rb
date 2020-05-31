require 'fastlane/action'
require_relative '../helper/codepush_login_helper'

module Fastlane
  module Actions
    class CodepushLogoutAction < Action
      def self.run
        Helper::CodepushLoginHelper.logout
      end

      def self.description
        'CodePush logout action'
      end

      def self.authors
        ['Pranit Harekar']
      end

      def self.return_value
      end

      def self.details
        'Log out of App Center'
      end

      def self.available_options
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
