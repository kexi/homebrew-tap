class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.19.2-beta.34"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.34/vibe-darwin-arm64"
      sha256 "3d8095b8f735368ec29abff6e9696f12cf1a22a44b5216dc7b07cdcc5de4a05d"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.34/vibe-darwin-x64"
      sha256 "a51e0d938129f2b3d751f98aaa93784769d2ca31ff4c64fb3590f07ebe940934"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.34/vibe-linux-arm64"
      sha256 "5cc59f9a25f63566be1d6bca89932effdf9aca957812a6127528c453c4286ff6"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.34/vibe-linux-x64"
      sha256 "f7867a939a12f2b40a31706ddd9e77e2173c223fd79dd8327169392891a3bc0f"
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
