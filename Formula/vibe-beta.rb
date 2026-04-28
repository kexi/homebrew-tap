class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.4.2-beta.96"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.96/vibe-darwin-arm64"
      sha256 "fe9cb47781f538b610fa3b727d620095c3343ce7e988881aebcdf9f93b744153"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.96/vibe-darwin-x64"
      sha256 "8bde154f9903d29ac0108b4a6165a43671a8f518672162dc8522bbbf8b997a6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.96/vibe-linux-arm64"
      sha256 "4e8b8d653f4b574f65aa826beec420a0ba3905570b475343d3e4858290098a71"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.96/vibe-linux-x64"
      sha256 "cdcaa98c5b0a2769af81e3c20873293dc25d49f37438f9e12242f14d463d18d2"
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
