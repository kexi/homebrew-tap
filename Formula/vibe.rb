class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.0.0/vibe-darwin-arm64"
      sha256 "77ff71cd1201cc9ab4da3f05daf08f952da3a69c1ed38dfee1bd6e6c783a8d36"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.0.0/vibe-darwin-x64"
      sha256 "e4564e7197fe9747929c01c7ed87c9868979c3e44e78aeb1f878a390b0b9ae23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.0.0/vibe-linux-arm64"
      sha256 "d836f7db8586b1f28749bd58d3735c1418bfc4d8984afa289527922eb5ed9531"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.0.0/vibe-linux-x64"
      sha256 "f36414bec6d0c1c8d7e43122f252513f448ea6c014935ed3aa5989d001870f94"
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
