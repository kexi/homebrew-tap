class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.23.0-beta.59"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0-beta.59/vibe-darwin-arm64"
      sha256 "2d2b66d5592cc922a1431420d44742f19288996ed9065be757e8392393ee800b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0-beta.59/vibe-darwin-x64"
      sha256 "3e66f191e5b8e3041a7b9d2adb7340bea887296633139bb9a7b81bb55cd4d7d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0-beta.59/vibe-linux-arm64"
      sha256 "aef843d49169e2936de0a03164fb995be29bc334da0954d74b5c5447ffc26c79"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0-beta.59/vibe-linux-x64"
      sha256 "ab435484f3de0c979b498c70d2f9bfce19d814c4aec99cc37eae63282fee0b0d"
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
