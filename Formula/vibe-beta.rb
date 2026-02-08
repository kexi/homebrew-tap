class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.19.2-beta.33"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.33/vibe-darwin-arm64"
      sha256 "7e4cebc8c1d123a9932a66dea14381adb88a8871e333371e624bc20764456981"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.33/vibe-darwin-x64"
      sha256 "9f70300e4c6348280acb77326759737bee288c44e1f7b2f8b622af0a1af3ba0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.33/vibe-linux-arm64"
      sha256 "864818e1bfc7c6e8ac33b9b45bb3344211ffa144cee8b4a12ee12ac0e6398e13"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.33/vibe-linux-x64"
      sha256 "800d8a550e4361cd986804ecf0ae3bce23e2e1f9a575ad85e49037cf3ffad62a"
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
