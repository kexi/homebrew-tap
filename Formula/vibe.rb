class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0/vibe-darwin-arm64"
      sha256 "b10ae95df857289667263f94b6ea76602ce7fe56b7bcb3bc73482a1f7a94aeaf"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0/vibe-darwin-x64"
      sha256 "9fe2f791373549af215f6a32bc8525a65f53a3c2bc4e4e35b64d6a9969240bea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0/vibe-linux-arm64"
      sha256 "2d0870e365638fdc7d6b0211327518774522e9dcac8a6adf311c764c0162cd8f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0/vibe-linux-x64"
      sha256 "bda40cec95f7e82b4ce3346bd0cc1be08550e5c6c4d6b11bd173769fbb5618f7"
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
