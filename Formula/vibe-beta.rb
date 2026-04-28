class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.2.0-beta.88"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.2.0-beta.88/vibe-darwin-arm64"
      sha256 "6d4b7c0e4db50259cad50f54b6bc96cd0eb7aa8c1005b22fe90564ee67f375f5"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.2.0-beta.88/vibe-darwin-x64"
      sha256 "5d82065a6fb1d18259904f5e5ce69c808bb9a11d8bca0bf9667ac394aa7c4621"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.2.0-beta.88/vibe-linux-arm64"
      sha256 "28416148c368f5764b533750912618df996b233434bf12188add239260848207"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.2.0-beta.88/vibe-linux-x64"
      sha256 "206310b55b2d562d6f1de2215327c4d074db4422777bd6a13a061704f406a60d"
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
