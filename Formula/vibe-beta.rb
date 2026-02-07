class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.19.1-beta.30"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1-beta.30/vibe-darwin-arm64"
      sha256 "31ece8547e5c66c84ba478d473b14083cab23c528952f4ae983ba1434da09669"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1-beta.30/vibe-darwin-x64"
      sha256 "7e55adeda660359fb176b3634347a717cad820af3b3fdf8086787a35caf3e752"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1-beta.30/vibe-linux-arm64"
      sha256 "c34a2de100fedbd76ed3eea548a476b2005218892df6133dbd160a208ae072bd"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1-beta.30/vibe-linux-x64"
      sha256 "37b32450db0071cd83f322f1d7d0a29d489ff23bae5bfdbdcdef1892e2498918"
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
