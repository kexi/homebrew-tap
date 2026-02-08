class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.20.0-beta.37"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.37/vibe-darwin-arm64"
      sha256 "50776c589d3b523043d4910a3b155fff70f6e7cc98db829f67ca02b731c840cd"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.37/vibe-darwin-x64"
      sha256 "9d2f99c79fb123ec0a71facc155ddd0a5dd333853809e6310e970568abadefd5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.37/vibe-linux-arm64"
      sha256 "454bbee831e46583b39dc26dfff9977022c7d98549c79f95e74f9190f1836214"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.37/vibe-linux-x64"
      sha256 "0d7c88c87d4995551cffe89ee45bc8736c7489732210d1bfae957fb4514e650e"
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
