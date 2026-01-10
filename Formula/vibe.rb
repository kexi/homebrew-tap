class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.5.0/vibe-darwin-arm64"
      sha256 "3214c0cf15bc5865497477b05264dbdd4984c84707dba3e41811d8e39a254fe1"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.5.0/vibe-darwin-x64"
      sha256 "3362ace0afd2051a1cf323dbcb125a210024036c064e2ab683437316be546c1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.5.0/vibe-linux-arm64"
      sha256 "22951955036dc58c956aff3de6acf3f7fa04ab5d96abcc13715242001fb9a64a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.5.0/vibe-linux-x64"
      sha256 "c856c3fd33382c71cfb46ce0b710c2dea2ce61deb8d4fae3b4f9a530a82859fa"
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
