class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.0/vibe-darwin-arm64"
      sha256 "67bfcb2bbf90f66d6651b26cd9992aedaab3b34ab66e033d42dbda0d7ff8ce0e"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.0/vibe-darwin-x64"
      sha256 "3d60b905f283d40917aae752bcd386c4bc051dc5da739d91b2ad134f338853e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.0/vibe-linux-arm64"
      sha256 "daa0acb69222dd8d45f208af40204dfa4e1bc15aba04b5cbf85db4f7d95b7d6e"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.0/vibe-linux-x64"
      sha256 "e11a9b9e1ef1ff6056c6a9f16bf46b9f4fb644de64cd594ff5d680f6189640e2"
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
