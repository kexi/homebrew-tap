class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.18.4"
  license "MIT"

  conflicts_with "vibe-beta", because: "both install the same binary"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4/vibe-darwin-arm64"
      sha256 "199526ea274dc20c890d99451ab3d065d3859de6c20e34314a7f3c236b503eca"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4/vibe-darwin-x64"
      sha256 "62c5ac5c2f08ebe22c6f9dc8c41515538b362d91a198695114f960f4d9f5ce04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4/vibe-linux-arm64"
      sha256 "c0516a0d780043c81c18a7a2aa31accb46b892b188dc8707665d346e9a1bbddc"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4/vibe-linux-x64"
      sha256 "6fe856f02a6a5500a8004666fc749ec9b2d6e9ff963f81a7fb5576092c7de571"
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
