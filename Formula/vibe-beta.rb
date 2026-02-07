class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.19.0-beta.28"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.0-beta.28/vibe-darwin-arm64"
      sha256 "2d0ce689d58b377f4e2ff0c170ac2da56700f546db4da46e3d8af853eec05d12"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.0-beta.28/vibe-darwin-x64"
      sha256 "e2210052fa82818919791ecb4bf4b9674a2c6df99ea0935f49cd0981a5bd5706"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.0-beta.28/vibe-linux-arm64"
      sha256 "efe524d0db73e5973bce78c73e3a78407acb842b29ea23f79207e28b1a2f5904"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.0-beta.28/vibe-linux-x64"
      sha256 "c0c2be18a617ef406a74c571b2531a6ed7bb3d561e7a8b5e1bb1aed17f468968"
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
