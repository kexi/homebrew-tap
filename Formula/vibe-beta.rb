class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.2.0-beta.86"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.2.0-beta.86/vibe-darwin-arm64"
      sha256 "4d2e89108f0408297e2c4702d84fa8f81c07d45b261f3cc4ba660cc5df754740"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.2.0-beta.86/vibe-darwin-x64"
      sha256 "7186b52c5a51bc54ebadd62f83320dda2004acd8bb86eda65e2c54610c71f579"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.2.0-beta.86/vibe-linux-arm64"
      sha256 "1741798df76068e1b19570fe53d591603dbd911647901a4a467d0a6b9011b5fa"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.2.0-beta.86/vibe-linux-x64"
      sha256 "23153847d04b77c29d6620b14afbf211abe4732e690213e8f605a72862784b2f"
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
