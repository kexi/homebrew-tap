class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.18.4-beta.23"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.23/vibe-darwin-arm64"
      sha256 "2775df67bffec665a6a9058625ea82f112990b9d9d947b72540b8a50ba59d3ba"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.23/vibe-darwin-x64"
      sha256 "53fd0c20038a32dce17cb148d204ead457ada6806cb478c3d1a4756f603db4d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.23/vibe-linux-arm64"
      sha256 "1b042d05e9a38eeb59d06648f46a03489c4121d07370aec9fcc6d75ff67e0a7f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.23/vibe-linux-x64"
      sha256 "83eecca4e826be89829433584c5b08e70d60426cda0a6bd0cd04f08243630d0f"
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
