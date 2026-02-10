class Dikto < Formula
  desc "Voice-to-text CLI for macOS — local speech transcription"
  homepage "https://diktoapp.github.io"
  url "https://github.com/diktoapp/dikto/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "e32d79aff0479d90d98b7cc070392b5d9c94bedd9384c3575ec0a87e30b66537"
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
