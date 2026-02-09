class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.21.0-beta.46"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.46/vibe-darwin-arm64"
      sha256 "810aa638e06afa411f7f30d495299a70691a5e0f2a1a291ed31ed404455d2b4e"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.46/vibe-darwin-x64"
      sha256 "73833fbe034d66defa9f878118c0e666e2fd911b9064e8ebced575aa75a4b78e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.46/vibe-linux-arm64"
      sha256 "6252162427a230faa8bb7f56e60bdba3f44fbb6f1c59e0d33a94c8303293d300"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.46/vibe-linux-x64"
      sha256 "11a160298ea378acdcdb6424ad33d7112bab3cf825de995609ab42bf844dac6a"
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
