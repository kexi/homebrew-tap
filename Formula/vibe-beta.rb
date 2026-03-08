class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.0-beta.63"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.63/vibe-darwin-arm64"
      sha256 "d65864175f61c07f40b6665ae1d1d37fd8604dac6426489435d2ede4956a78d5"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.63/vibe-darwin-x64"
      sha256 "9b20f1e59f3338e1be9671840ca40d2f5b8fc409181c54da105e45730f887695"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.63/vibe-linux-arm64"
      sha256 "3fa110fb5cdf425c06b5b569e7c9f9c7a6588f5319a8532307afcdd340036a6f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.63/vibe-linux-x64"
      sha256 "a314e34229ae6138ef558f371206652d57d0cd67218ed5248c5d252be6c3145e"
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
