class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.12.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.6/vibe-darwin-arm64"
      sha256 "5bf25bc1cc9f0f4dbc89a19c851e4e4d7e42bd416cadbfd52fa9ea1de4bf0e3b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.6/vibe-darwin-x64"
      sha256 "7025b4d60f586bb47ed31c68e6dbc9075658e76fb3fd2010c8567983e68b396d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.6/vibe-linux-arm64"
      sha256 "604b5354670ce6ddeaf536f15be7008f563018f7e9fd988f17d7162e53ba7770"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.6/vibe-linux-x64"
      sha256 "d4ed5ca5a0782bcabdf0ddb7ab9f8503778bc02f7c1b9415e2d52701e094e3de"
    end
  end

  def install
    binary_name = "vibe-darwin-arm64" if OS.mac? && Hardware::CPU.arm?
    binary_name = "vibe-darwin-x64" if OS.mac? && Hardware::CPU.intel?
    binary_name = "vibe-linux-arm64" if OS.linux? && Hardware::CPU.arm?
    binary_name = "vibe-linux-x64" if OS.linux? && Hardware::CPU.intel?

    bin.install binary_name => "vibe"
  end

  def caveats
    <<~EOS
      Add this to your .zshrc:
        vibe() { eval "$(command vibe "$@")" }
    EOS
  end

  test do
    system "#{bin}/vibe", "--help"
  end
end
