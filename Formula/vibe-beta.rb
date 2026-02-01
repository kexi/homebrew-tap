class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.17.0-beta.9"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.9/vibe-darwin-arm64"
      sha256 "48673f1e36f5753ccb19f4c9f6873f471b2196a6f83d664c6a95e05897277e4c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.9/vibe-darwin-x64"
      sha256 "3b2f5d2fc0a5d71263b6c5fbab67524844c727979a9f00f51adfe9b51770cf71"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.9/vibe-linux-arm64"
      sha256 "e2d207252831dbb2f759b14211e7eb88936d6533c11a542cda75ff75334099e5"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.9/vibe-linux-x64"
      sha256 "a2e6bd190ac85d7995e6c3acfecac2f4851f3147265525cc9cd713c048c0ece8"
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
