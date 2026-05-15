class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.5.0-beta.106"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.0-beta.106/vibe-darwin-arm64"
      sha256 "95a8177dd573ca53832de3374655f21a457d4ca1ec0db0942313de0b9fc3dbe6"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.0-beta.106/vibe-darwin-x64"
      sha256 "f5240e13322b6f3bd3b93f0076829636a9849bb2ef513889200394247b3abf09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.0-beta.106/vibe-linux-arm64"
      sha256 "63bcb858b66306c725ecd440a690c8eae2e139e3ab0d5519d09aeaa06d299aec"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.0-beta.106/vibe-linux-x64"
      sha256 "be58e76c4832c878337ec6c2c98213b7daafc0cc9e8754fe06b81cea44544e25"
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
