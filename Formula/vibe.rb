class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.15.0/vibe-darwin-arm64"
      sha256 "7eddc507ba6a90603f74523657134231774e53314e4094b28b2a095808ec02d5"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.15.0/vibe-darwin-x64"
      sha256 "0be9ce10400e1bfe220afb1c6376cd13f23db1b9aacb4d4c9c77c9445dd3416a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.15.0/vibe-linux-arm64"
      sha256 "f8f03a370f7f7e75ddebf10c2988b202264dd8aaf8894a73443b7383ec82fda9"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.15.0/vibe-linux-x64"
      sha256 "d3739d830c45b3b7bf059510f706fd7917e49dbfcc4deb9b31cc83cc48e1e93c"
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
