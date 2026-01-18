class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.13.0/vibe-darwin-arm64"
      sha256 "41a72d531eba6960e1e40434d0efa04cbe4716b917ebebbffb9febe5ee742763"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.13.0/vibe-darwin-x64"
      sha256 "e0b38776524da5530a98b6cc8a4b6ef3acedb194c1eb6f7f7c603926f7663add"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.13.0/vibe-linux-arm64"
      sha256 "3137c3292bd240df05a2c79bdca3d205a9a96f8169c69def9c5d916ecd3a0b6d"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.13.0/vibe-linux-x64"
      sha256 "0d708e549919b14ba81b1041bad8bfb163239e65b50afb7e801759531979a873"
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
