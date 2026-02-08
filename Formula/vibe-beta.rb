class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.19.2-beta.35"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.35/vibe-darwin-arm64"
      sha256 "b96a98a76a2b821836f1726038c7b72106f97614e1705581573ba86d1ca10642"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.35/vibe-darwin-x64"
      sha256 "a4ce91b79ca2b875f55a2b16e8fa2a2a7043a03e6f22eb47b9f4c27cfb353e30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.35/vibe-linux-arm64"
      sha256 "7b63dcc7984e1824d929eb8ba079f31f5b7ebc919513de33fbd5507397b60228"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.35/vibe-linux-x64"
      sha256 "694d2fc54c0f23f13fe452226b667b1a2a0b16210ef2650acc0ba80bc0a63c2b"
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
