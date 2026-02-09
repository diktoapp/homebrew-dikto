cask "dikto" do
  version "1.0.0"
  sha256 "PLACEHOLDER" # computed after first release

  url "https://github.com/sourabhbgp/dikto/releases/download/v#{version}/Dikto-#{version}.dmg"
  name "Dikto"
  desc "Voice-to-text transcription for macOS"
  homepage "https://github.com/sourabhbgp/dikto"

  depends_on macos: ">= :sonoma"
  app "Dikto.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Dikto.app"], sudo: false
  end

  zap trash: ["~/.config/dikto", "~/.local/share/dikto"]

  caveats <<~EOS
    Dikto is not notarized. If macOS blocks it, right-click the app and choose Open,
    or run: xattr -cr /Applications/Dikto.app
  EOS
end
