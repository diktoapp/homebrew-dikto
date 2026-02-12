class Dikto < Formula
  desc "Voice-to-text CLI for macOS — local speech transcription"
  homepage "https://diktoapp.github.io"
  url "https://github.com/diktoapp/dikto/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "bf0bfd18c7047ffc5f605668cd02b1968bbc83adae07c467e5e2994bd93b8183"
  license "MIT"
  head "https://github.com/diktoapp/dikto.git", branch: "main"

  depends_on "rust" => :build
  depends_on "cmake" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/dikto-cli")
  end

  test do
    assert_match "dikto", shell_output("#{bin}/dikto --version")
  end
end
