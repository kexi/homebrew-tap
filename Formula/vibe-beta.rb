class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.22.2-beta.54"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.54/vibe-darwin-arm64"
      sha256 "2217fff3c0cc975f30f6db518bd564402dc3cd941d352b32c5677434e5feae8f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.54/vibe-darwin-x64"
      sha256 "806aa5a740e4027518d00eeddac72c3b0fbb371f77cb0cf948bc5b3b30dd24dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.54/vibe-linux-arm64"
      sha256 "9e5d625eedf7dbeb6f64b9ff6764e2b06a136d296d1ed30b8110ed5189cf92dd"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.54/vibe-linux-x64"
      sha256 "6deb77fa37af47482646be26b9cc7d90d610a1e80c6ea67332b07df95908fe5f"
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
