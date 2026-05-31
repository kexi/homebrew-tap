class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.8.0-beta.127"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.127/vibe-darwin-arm64"
      sha256 "5648b81771c42d84e44833b96161e2239afbb0ef862ba9fd4a65cd30afe362cf"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.127/vibe-darwin-x64"
      sha256 "e4b8bc9d4c4d6303c00eafa4f6d9bb24026938b8ed071c49dce23f7f492437e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.127/vibe-linux-arm64"
      sha256 "1992999b4ed1356415acc171853240417fbf01af8126a1ed5685bd0fff12daa8"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.127/vibe-linux-x64"
      sha256 "8c691ec70d3935bdb9267966bd6294d8f334e7aa675bc7d5557dfa9c3a0374b9"
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
