class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.19.1-beta.29"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1-beta.29/vibe-darwin-arm64"
      sha256 "9798603ee939fd49178b6f0d5bfcb7461bee6789bc58126f7eea2653adc292df"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1-beta.29/vibe-darwin-x64"
      sha256 "ccc7a8e2dc40550a766b56f9dd450e84dfa031cef0c5eb50b0b1704173be9c04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1-beta.29/vibe-linux-arm64"
      sha256 "7a8919ad80a92eec747d6cd4e38067908d806cee24cdbbcaa28f54373de8173d"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1-beta.29/vibe-linux-x64"
      sha256 "b05d4c45950c7a82cdde2e9235fa1a1a9311115c726ce5f2f2838d09f0335da3"
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
