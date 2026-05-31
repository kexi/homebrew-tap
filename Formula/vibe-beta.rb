class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.6.0-beta.118"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.118/vibe-darwin-arm64"
      sha256 "c4f71c6e2e1ec7db4004c5adf28aa85209e5812cea48a5c690e4f2efda3fc8ca"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.118/vibe-darwin-x64"
      sha256 "c6b67bcb85893075c502adfc399255a645d8255ee83870a3d4cb625eaa034d41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.118/vibe-linux-arm64"
      sha256 "0f222069272c6949285350c85a48217dc9b4b36d4e6952956ee77045d5dd7c78"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.118/vibe-linux-x64"
      sha256 "95db0fe080b6ec39c2088471a431ebc95445e1136fcc9965f6afe2d7e0107aed"
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
