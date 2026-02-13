class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.22.1-beta.50"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1-beta.50/vibe-darwin-arm64"
      sha256 "4fbc0d9f9d7dfdcc1427cba48ea4aa93f45ca7ce0de6922f723b5f28743279d2"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1-beta.50/vibe-darwin-x64"
      sha256 "9891b95c93553973172e6e4bd24e1cf1feec2045c900b807b4346f297d7a9d50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1-beta.50/vibe-linux-arm64"
      sha256 "bbf9ea2cf43104ed87816475b132e07664dce500d25d1b60e03c500fec2fa423"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1-beta.50/vibe-linux-x64"
      sha256 "ed14f6e6f45e8a5a00919e04174b60835f2d4d4a625fc82dbce3de7e4d609fc7"
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
