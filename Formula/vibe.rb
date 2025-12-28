class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.2.0/vibe-darwin-arm64"
      sha256 "54cc6ede7ff114f170a501e4bffd7aed5be9f12309d4753256b9568c905792b4"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.2.0/vibe-darwin-x64"
      sha256 "95c6e2cee96be338187c62ecf462c2fc0459a9261c667b2ad5d9706e3e4067b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.2.0/vibe-linux-arm64"
      sha256 "01b14a92dff6a65a84cd166a6905b694e06ff8766d0ade00b78e2db863e2a827"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.2.0/vibe-linux-x64"
      sha256 "65708663a924059414891bb9937ba333e79366c51735a8f49e4e694740b1d967"
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
