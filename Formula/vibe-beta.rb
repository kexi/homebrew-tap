class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.19.1-beta.31"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1-beta.31/vibe-darwin-arm64"
      sha256 "d5bb40dec76f658e554d429bf4ce3f8853c84f8ab35ca8743c888a97941286f8"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1-beta.31/vibe-darwin-x64"
      sha256 "c6f74dc3e69e44e6e95b15db305611d7e8237ebaad83ab856ceb40bfae37fc76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1-beta.31/vibe-linux-arm64"
      sha256 "632a6427d30d8c3225535125588112db9c67576a311d6d5d5de063ad53655bad"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1-beta.31/vibe-linux-x64"
      sha256 "cc7a4e14ca141777597667affc065bc0dad29adc28ca58db6143db24c7663075"
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
