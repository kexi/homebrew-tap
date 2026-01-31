class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0/vibe-darwin-arm64"
      sha256 "3ffc4fbadc255e4fc95d0ee540e47431c8cb10805fced5d33c32e16e06b2509a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0/vibe-darwin-x64"
      sha256 "c786b685177e0e0a3b8fc9e6fc87e4a6f082c95d72c2467ddf142a969bd3f8ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0/vibe-linux-arm64"
      sha256 "eea1de67ca4fa8e314cfcfcf04991295082bf2fd9bd7cb6938b4f3c06029dbc0"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0/vibe-linux-x64"
      sha256 "587363ef548d8df3eafd91af671efd84810a9f55026b21c685a1700be9ac98ac"
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
