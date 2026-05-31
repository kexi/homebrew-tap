class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.8.0-beta.128"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.128/vibe-darwin-arm64"
      sha256 "fdd3bb978c73a7e958b70d898856a743d8f85d9792dcf430f910bcb8942e654e"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.128/vibe-darwin-x64"
      sha256 "82d57385dfb26d1446944fd9a01bb36b0ad8455803f8c0436d6ffa6c967f672b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.128/vibe-linux-arm64"
      sha256 "114ec84831631ab2f1f00547da02594e74cc2eedf6e5292373d28b27a7eb8888"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.128/vibe-linux-x64"
      sha256 "657f101404a1a96719f098d58df93a62ecbe16e56246ba443e7d65bfcf60fdc9"
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
