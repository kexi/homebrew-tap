class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.4.3-beta.101"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.101/vibe-darwin-arm64"
      sha256 "31879fa400cf424d2cb13d4c5bf20450f05e0abd9a49e129775ac9a6f8663ca2"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.101/vibe-darwin-x64"
      sha256 "18cfa5febd2c4c62d77cde18e83ae4633b22e3f760cd4c844b88ed3b7aada4f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.101/vibe-linux-arm64"
      sha256 "4ee017ecdc29b198ac474770b60ce8e8c8f2b0ce2c9a8118705e14ba1dddde71"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.101/vibe-linux-x64"
      sha256 "6f7d4f19ef373f27329133ed22b6b5e8e01dcde3c317954455522b99c1ae096a"
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
