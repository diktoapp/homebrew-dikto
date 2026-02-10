class Dikto < Formula
  desc "Voice-to-text CLI for macOS — local speech transcription"
  homepage "https://diktoapp.github.io"
  url "https://github.com/diktoapp/dikto/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "3e817087e1a56f3358da15ea94da089ba8e93a1d3be15e735f4eff36f026189f"
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
