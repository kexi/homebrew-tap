class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.23.0-beta.60"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0-beta.60/vibe-darwin-arm64"
      sha256 "94b2f6b0a9e6b9ec89de5cd47f38a7e174370cd7b7b74fc480a502e39f993fcf"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0-beta.60/vibe-darwin-x64"
      sha256 "d345b2c4be26b0acb9db8548e8cfed7f5d3b7c668514c5938f0635fdd18a2687"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0-beta.60/vibe-linux-arm64"
      sha256 "ff17e96c9eabce5a1e4d1c5ee8401a5dda8275565c9189400930f557465264ac"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0-beta.60/vibe-linux-x64"
      sha256 "611bce79bbee35ce498eca723a3ad6842bc6847c4aa34de6a69bb7fbcd5ceca3"
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
