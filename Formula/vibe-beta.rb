class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.20.0-beta.40"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.40/vibe-darwin-arm64"
      sha256 "86e3cb1b24e02869f25451543fccac373ac3b1769f0b46b8b2990e8cb772bb98"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.40/vibe-darwin-x64"
      sha256 "3e8836be1efb307d3a7c44f549bb6ea45af7ffafea77608d2e23e0bcde5ddd46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.40/vibe-linux-arm64"
      sha256 "3af3e6b4492d9384a09a5a29b0816d7f52c1101377093414888a6b30a3db7ae5"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.40/vibe-linux-x64"
      sha256 "8481a5a6df6a6996ab334d5e09e8b7f309d52a4a413bd64d11ac215b8212fbfd"
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
