class Dikto < Formula
  desc "Voice-to-text CLI for macOS — local speech transcription"
  homepage "https://github.com/sourabhbgp/dikto"
  url "https://github.com/sourabhbgp/dikto/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PLACEHOLDER" # computed after first release
  license "MIT"
  head "https://github.com/sourabhbgp/dikto.git", branch: "main"

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
