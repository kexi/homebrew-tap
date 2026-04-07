class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.1-beta.77"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.77/vibe-darwin-arm64"
      sha256 "a3e6b8e0480ba4bee9a51507d6d382b81cf32f7b2ad9eed635a239e6e9aed42f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.77/vibe-darwin-x64"
      sha256 "3bd406f78fffffda4cba9c40b217f96ff528b7e1f7139980466dc1d11cd34ace"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.77/vibe-linux-arm64"
      sha256 "f97124608330d5714292dc31cc3f2f7c975f2e768c7674fb46bd49964a70aa53"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.77/vibe-linux-x64"
      sha256 "0687d490f02b7967d3c4db394f9affd305f7d3220db9fbe0d3119921f82035ea"
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
