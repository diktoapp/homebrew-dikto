cask "dikto" do
  version "1.1.2"
  sha256 "cb9dbd2f4fa0c158abe455b3f37bdee9cd5a9002edeff716faf99d0467c9fb1b"

  url "https://github.com/diktoapp/dikto/releases/download/v#{version}/Dikto-#{version}.dmg"
  name "Dikto"
  desc "Voice-to-text transcription for macOS"
  homepage "https://diktoapp.github.io"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64
  app "Dikto.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Dikto.app"], sudo: false
  end

  zap trash: ["~/.config/dikto", "~/.local/share/dikto"]

  caveats <<~EOS
    Dikto requires Microphone access and Accessibility permission for auto-paste.
    Grant both in System Settings > Privacy & Security on first launch.
  EOS
end
