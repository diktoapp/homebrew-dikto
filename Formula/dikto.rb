class Dikto < Formula
  desc "Voice-to-text CLI for macOS — local speech transcription"
  homepage "https://diktoapp.github.io/dikto"
  url "https://github.com/diktoapp/dikto/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d8df268c18e08af58721dad22988ccb528e4740ce61c6512769da5e025109c3b"
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
