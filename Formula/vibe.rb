class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0/vibe-darwin-arm64"
      sha256 "7b2c6b59f2687c9af10d50bda936e700a38766211c68600be2799454972df8c4"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0/vibe-darwin-x64"
      sha256 "5ca2168039511cdb80e6eaadc35b457c3eb238b8d9680fae936ee6be59d596e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0/vibe-linux-arm64"
      sha256 "f9f465ed5448ad8e5df694069d4e9f5ac7c2d1f0189d0ac28ab7c18b4c86728b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.23.0/vibe-linux-x64"
      sha256 "444dafa1b801a33416de4c2c1b321717943eafeb701f57aac3d637d65cc25407"
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
