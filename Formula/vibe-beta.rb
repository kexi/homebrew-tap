class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.21.0-beta.45"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.45/vibe-darwin-arm64"
      sha256 "47d07c00410758a23ddf083ae42f034a6808c054f3f2375a941b5563d919cce2"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.45/vibe-darwin-x64"
      sha256 "d2b2f916da21eb5a02f5cdfab70cf57bb0fb409135447c67c1166a11847d5b91"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.45/vibe-linux-arm64"
      sha256 "e0634872e6daa7c7b3e03cbbff2f540151a8ce94a2aed611ab69d68b564dbd3e"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.45/vibe-linux-x64"
      sha256 "aef95a7c693a63088e9f0a1a805a2f08dafe60b577868f5654c610ae4917483f"
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
