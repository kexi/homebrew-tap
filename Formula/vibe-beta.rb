class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.4.2-beta.99"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.99/vibe-darwin-arm64"
      sha256 "f2bcfaf36dbc9eb344d7ab599bf6c254a93cfb83efaa84ebd565b1ae9a67e86f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.99/vibe-darwin-x64"
      sha256 "dc01beac74963db3fbade4cbc5c9692a84006c990af19995913bd868264ae30a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.99/vibe-linux-arm64"
      sha256 "452c0d86b5d2b19e7e57668aac5dd09d261f7b0d0e3a7cc592b9ee9444ae680b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.99/vibe-linux-x64"
      sha256 "74f61a9f819a0f2fe4550d3d4475979d9f78ebc2637aca9fc631fbc6b6da706b"
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
