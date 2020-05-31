describe Fastlane::Actions::CodepushLogoutAction do
  describe '#run' do
    it 'prints a message when successfully logged out' do
      expect(Fastlane::UI).to receive(:message).with("✅Logged out successfully")
      allow(Fastlane::Actions).to receive(:sh).with("appcenter logout").and_return("test")
      Fastlane::Actions::CodepushLogoutAction.run
    end
  end
end
