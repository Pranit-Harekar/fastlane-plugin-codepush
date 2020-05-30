describe Fastlane::Actions::CodepushLoginAction do
  describe '#run' do
    it 'raises an error when no args are passed' do
      allow(Fastlane::Helper::CodepushLoginHelper).to receive(:is_logged_in).and_return(false)
      expect { Fastlane::Actions::CodepushLoginAction.run }.to raise_error(ArgumentError)
    end

    it 'logs out when enforce is true' do
      expect(Fastlane::Helper::CodepushLoginHelper).to receive(:logout)
      Fastlane::Actions::CodepushLoginAction.run({ enforce: true, login_token: "foo" })
    end

    it 'prints an error when invalid args are passed' do
      invalid_args = [nil, 1, false, 999_999, true]
      invalid_args.each do |arg|
        expect(Fastlane::UI).to receive(:user_error!).with("💥Missing login_token param")
        expect(Fastlane::UI).to receive(:message!).with("Note: You can either pass login_token or set APP_CENTER_LOGIN_TOKEN environment variable")

        allow(Fastlane::Helper::CodepushLoginHelper).to receive(:is_logged_in).and_return(false)
        Fastlane::Actions::CodepushLoginAction.run({ login_token: arg })
      end
    end

    it 'prints a message when user is already logged in' do
      expect(Fastlane::UI).to receive(:message).with("User is already logged in")

      allow(Fastlane::Actions).to receive(:sh).with("appcenter profile list", false).and_return("blah blah")
      Fastlane::Actions::CodepushLoginAction.run({ login_token: "test" })
    end

    it 'prints a message when successfully logged in' do
      login_token = "foo"
      expect(Fastlane::UI).to receive(:message).with("🎉Logged in successfully")

      allow(Fastlane::Actions).to receive(:sh).with("appcenter login --token #{login_token}", false).and_return("blah blah")
      allow(Fastlane::Helper::CodepushLoginHelper).to receive(:is_logged_in).and_return(false)
      Fastlane::Actions::CodepushLoginAction.run({ login_token: login_token })
    end
  end
end
