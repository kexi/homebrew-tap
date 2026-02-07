class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.18.4-beta.25"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.25/vibe-darwin-arm64"
      sha256 "475d75b21456985d05cad666df956a0d2f806b46b3854e47bec613c81bd0ee94"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.25/vibe-darwin-x64"
      sha256 "508f0b336d303e8f03fcfb8e8d862497483ade1ae7194ddcc7d0f290a9b29d8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.25/vibe-linux-arm64"
      sha256 "4209498177c04ed2bbecb60f56fec46baf987427dac8d5dd89d696e3f74a10a3"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.25/vibe-linux-x64"
      sha256 "e64e099caeb15be9f47f6a2e1da7cbb3fa84df057e5e5f728877f6e41f792713"
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
