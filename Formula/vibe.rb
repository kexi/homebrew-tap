class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.12.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.2/vibe-darwin-arm64"
      sha256 "0c9e9bb31ec0733a8765a16f12084c5cc18d859d6f52898a7e68d096c0f009d2"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.2/vibe-darwin-x64"
      sha256 "c6a451414856e96e9752335dd1923a54645d0a7005ddc2ce5d696112fdf7c061"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.2/vibe-linux-arm64"
      sha256 "ab6943f7b5450d57e9f1e041c04b536eb12e4b6bf5151b23bdc7908af042d466"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.2/vibe-linux-x64"
      sha256 "d2a3bd3f20ae9a48db9787305b71bedb4946e0dd53746538de68b259965114a4"
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
