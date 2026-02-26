class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.23.0-beta.58"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0-beta.58/vibe-darwin-arm64"
      sha256 "3122a4eb575dc4246111973a098df17027f7cd33a5fd4327eed90a7b7e17a5fa"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0-beta.58/vibe-darwin-x64"
      sha256 "2af22e288f01940100cc1a4c1b221b0cea6698031a411af0f23e28b814c605d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0-beta.58/vibe-linux-arm64"
      sha256 "5e949b1f6e4be857b43946a25f6cad8cc42e91ca102fb1b0745c50f66d687bf1"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0-beta.58/vibe-linux-x64"
      sha256 "ec478288a64b851bad7d93f3188c161787729fb713ed31713c99e1e6c1d6a45b"
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
