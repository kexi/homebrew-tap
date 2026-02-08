class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0/vibe-darwin-arm64"
      sha256 "7d47bb56676f293f8906a894e7744057aaa91941a9bf6ea90f975ef27a73d351"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0/vibe-darwin-x64"
      sha256 "54e776da8ea4ffcdc669146bf1f5cf326acad76b5e6ca67eb12bca2ac36b48aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0/vibe-linux-arm64"
      sha256 "6f0067186e6be54e4facdb3ad5a8c2459a7bb1e4c0c1f4be1c504026bfa2069a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0/vibe-linux-x64"
      sha256 "54aa06b37d7dae786af0ac4224f1408aa1af52b57609aa15e1e550e52b920111"
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
