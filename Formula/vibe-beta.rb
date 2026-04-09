class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.1-beta.80"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.80/vibe-darwin-arm64"
      sha256 "bc09553c5842fe24f82e3c2792906da2e8e20a8855f13826386fdad1ec7d4bc5"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.80/vibe-darwin-x64"
      sha256 "5cbb2773f4aa352ada88a7d1f2aca96ef20c82fc0b4f664ad777eada7ff358d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.80/vibe-linux-arm64"
      sha256 "eb2271f5b11827c937977b8bcb4abceb97df409e065d2ea946883bace630518b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.80/vibe-linux-x64"
      sha256 "165294b3a1fca74501f7ab582d2310afc8d1c8a069c81769f9e4d1266f38ed2a"
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
