class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.18.4-beta.22"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.22/vibe-darwin-arm64"
      sha256 "c164d80b0e8f95b3bb7fa2c2ad52f3cd61a0eb92a4de281bb381a141d5db5934"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.22/vibe-darwin-x64"
      sha256 "b64fab093abedb64fa289d2048cf7d1e938d6d469ad392acbdce5f2726eeebaf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.22/vibe-linux-arm64"
      sha256 "5ee5c8880c508871727dd9685c2df4ef28189c6fb12646f3d57de7d7e36de03f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.22/vibe-linux-x64"
      sha256 "dd1a049e70d1a0b2ba7b7e855626b9e6d264799ee59fd8f60f3ba21eb8c7a863"
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
