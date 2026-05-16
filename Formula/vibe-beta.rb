class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.6.0-beta.113"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.113/vibe-darwin-arm64"
      sha256 "0172753e39c6b9acf60e3f8e7cea5f5aa5e06b334eebdecc72dd3523261d7371"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.113/vibe-darwin-x64"
      sha256 "518b815becfffaae77b284c1d9e710713c3403c10aefb0bc5c29d7af2b98a757"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.113/vibe-linux-arm64"
      sha256 "a87d2c139daa9cadf6526b67b38e8fec28f1fc5f5d4317349275369c87023a54"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.113/vibe-linux-x64"
      sha256 "ea052e49720ce687d40c74b08aefaf601d4c2586f33d54e2ba3fdd70d3faa7f8"
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
