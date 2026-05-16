class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.6.0-beta.115"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.115/vibe-darwin-arm64"
      sha256 "ec41679df7b3cbf62473af913a52b9b5fc08de61639554c22e95e1d1d8d8300d"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.115/vibe-darwin-x64"
      sha256 "d5a82fbd6bd456150f5652976c3b61b31ea8f9d123fe3941884c039ca272c548"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.115/vibe-linux-arm64"
      sha256 "a3297421818d250371eb50428e5de3c7344d5ad219b903232900e005a26f0f9c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.115/vibe-linux-x64"
      sha256 "af4c5c7995e9773320f5e9bf7fe43a67a4f3e9974834c6a50647ceddf4bf1155"
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
