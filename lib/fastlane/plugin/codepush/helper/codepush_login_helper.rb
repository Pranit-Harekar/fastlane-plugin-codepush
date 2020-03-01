require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?('UI')

  module Helper
    class CodepushLoginHelper
      def self.login(login_token)
        Action.sh(
          "appcenter login --token #{login_token}",
          print_command: false
        )
      rescue StandardError
        UI.user_error!(
          "Something went wrong during App Center login!! Please ensure login token #{login_token} is correct"
        )
      end

      def self.logout
        Action.sh("appcenter logout")
      end

      def self.is_logged_in
        logged_in = true
        begin
          Action.sh(
            "appcenter profile list",
            print_command: false
          )
          UI.message("User is already logged in")
        rescue
          logged_in = false
          UI.message("User is not logged in")
        end
        logged_in
      end
    end
  end
end
