class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.18.4-beta.24"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.24/vibe-darwin-arm64"
      sha256 "bfe7cb311d87bf0408072a8f59bd199b89dbcedbfb9d13cdbf2b94ef3773d2ca"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.24/vibe-darwin-x64"
      sha256 "f16a1f3f6f23bda9f48e628e1d9f00438bd17410252bb18a9cc6a40f73eb1b15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.24/vibe-linux-arm64"
      sha256 "633aa7893bc3c50df40a7fa5405bc6789054a58a0c5f404b4d5494a3699db026"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.24/vibe-linux-x64"
      sha256 "68c3c7c42afd67c7088b6fd5a1e71f8cfbb8ad5250fdae9e60fb28a3c5099708"
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
