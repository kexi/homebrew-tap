class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.19.0-beta.26"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.0-beta.26/vibe-darwin-arm64"
      sha256 "61896f6475e4c852c63a6790f82e1df398c1c622e587faa4962386400c62acba"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.0-beta.26/vibe-darwin-x64"
      sha256 "d6fa4b8f443e8dcdf5dd87ba247262726eca9b4de4ef53e924a1f396353b2816"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.0-beta.26/vibe-linux-arm64"
      sha256 "adc07d5038b4c978069085bf44abd106f9525a18b12e447fe4e3f0512da3f392"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.0-beta.26/vibe-linux-x64"
      sha256 "18a281414e863a64d61735095ba62df9ef7ef92df3e90e536f8521ab46f25bd4"
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
