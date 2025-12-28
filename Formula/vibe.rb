class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.1.5/vibe-darwin-arm64"
      sha256 "aa6f88ce729ff2f3068f7ddb6dd432238e144d94e12249d6743305a25f4786bb"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.1.5/vibe-darwin-x64"
      sha256 "ff28b08b3052e3f4cbd7a433332669f73484a986189a85365b3e4d768318a698"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.1.5/vibe-linux-arm64"
      sha256 "b92dbb3547a0d516a4aa3a695d6add5f089db3b686664f69ea77f3b362323c57"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.1.5/vibe-linux-x64"
      sha256 "2f9563970051e5a0cf74cdfc3ee1242041705ad8d6b9eed1bc4b9691a51c0399"
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
