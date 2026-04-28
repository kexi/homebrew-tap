class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.4.0-beta.91"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.0-beta.91/vibe-darwin-arm64"
      sha256 "af7a83661ab0a78461060ed1e5e9f875b3891162bacc684509aeba94c97b407c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.0-beta.91/vibe-darwin-x64"
      sha256 "addca4ba7886f7fdf78cbda41c2263d0029c5ecf9ec5572d7091ecd7cf47f9b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.0-beta.91/vibe-linux-arm64"
      sha256 "4ee1a202e1b4a4f99cedd844b5e97388f93c2c103fffef2db2047d2929e0d17b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.0-beta.91/vibe-linux-x64"
      sha256 "dd5c219f330142bbe220e78fce4db76835484f39489318c230ccf0796092808a"
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
