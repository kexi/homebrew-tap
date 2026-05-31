class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.8.0-beta.131"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.131/vibe-darwin-arm64"
      sha256 "014f5a9f0ec106db527b67041686d33b2bfb22f49367f994c2202ad5c7d69f16"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.131/vibe-darwin-x64"
      sha256 "3e49c21843a80ed7714f1f4e444e31239f3b2fc8c6b1debaacf27692c8583abd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.131/vibe-linux-arm64"
      sha256 "4548e457c1909d601b3b630dad1e6f2f0007e87a3e061f01082cc685a8e9ad12"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.131/vibe-linux-x64"
      sha256 "3eef5035d764a22493703d3f29723f10ee51ba7e11a4f414d29a3b12a7bf96ca"
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
