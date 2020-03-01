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
    end
  end
end
