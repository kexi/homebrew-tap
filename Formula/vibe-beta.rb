class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.19.2-beta.32"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.32/vibe-darwin-arm64"
      sha256 "6f4ffd19904dd1e8e1ec0a129f7c51ea85c99e72ed19b807e54a18bacb1ca4fb"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.32/vibe-darwin-x64"
      sha256 "fd68e2059e950d7e6f55220d8e4731d3388f2c223c9265ada477417bfaddcce3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.32/vibe-linux-arm64"
      sha256 "60b7ab4b5a1c89b9e357d3b7e2ff049ee93a035774ba810af115ad474b67170b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.32/vibe-linux-x64"
      sha256 "993091693a9e30637eae8c6e2fcdb5fb834afa78ffbec5a0a6b9bfd8f143585b"
    end
  end

  def install
    binary_name = "vibe-darwin-arm64" if OS.mac? && Hardware::CPU.arm?
    binary_name = "vibe-darwin-x64" if OS.mac? && Hardware::CPU.intel?
    binary_name = "vibe-linux-arm64" if OS.linux? && Hardware::CPU.arm?
    binary_name = "vibe-linux-x64" if OS.linux? && Hardware::CPU.intel?

    bin.install binary_name => "vibe-beta"
  end

  def caveats
    <<~EOS
      ⚠️  This is a BETA version installed from the develop branch.
      It may contain unstable features. For the stable release, use:
        brew install kexi/tap/vibe

      Add this to your .zshrc:
        vibe-beta() { eval "$(command vibe-beta "$@")" }
    EOS
  end

  test do
    system "#{bin}/vibe-beta", "--help"
  end
end
