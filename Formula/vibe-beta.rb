class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.7.0-beta.122"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0-beta.122/vibe-darwin-arm64"
      sha256 "a473859cc548987cfd836e0c7040c2e4b4b4592efb33dbf775242d5bbed54ee4"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0-beta.122/vibe-darwin-x64"
      sha256 "8acee9a31df43079d047ad550a39ed5a63d52d2f8adb39b45a9d5f77bf0575db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0-beta.122/vibe-linux-arm64"
      sha256 "e264fa9779b4edebb80c6643eb94262ec620ddce4e6e2ba02da94e35951d7ec6"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0-beta.122/vibe-linux-x64"
      sha256 "4a09b078cfa0527daeaad8029cd6150cfd2117ee4d3d6e930f3f6d0a5c7baa9b"
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
