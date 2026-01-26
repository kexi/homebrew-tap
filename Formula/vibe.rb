class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.16.0/vibe-darwin-arm64"
      sha256 "e2bd7f8131f48c278db38e3faf90602d9d684cd20a7222cdebfa3dcd82a51035"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.16.0/vibe-darwin-x64"
      sha256 "82b9cb8e36be478f4d7f6bdc7c2de12390714dc3ec3e5e65bb6e357f73ac6347"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.16.0/vibe-linux-arm64"
      sha256 "fcebdc8a4692cf5be0c1100791b6c1099723897707aebe7c459a956a361c08fc"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.16.0/vibe-linux-x64"
      sha256 "8503a3f33951ae3228822853c66169b7305f8fec964eba7c3edbe9cbb0daed33"
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
