class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.0/vibe-darwin-arm64"
      sha256 "1d5073ee46fe63f11e1067823a0fb38717911b22a5fc96fa4b09036c99cd094c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.0/vibe-darwin-x64"
      sha256 "45ea0750a5c48e04a511c6618105b7601c58190b2851eae4c0f4af514d8ed598"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.0/vibe-linux-arm64"
      sha256 "9220a8e6be0b9dadb8d64ee39f21901589b5b53b771a4a6ab633e8e7b58afe24"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.0/vibe-linux-x64"
      sha256 "6c593f113a8fd568b39611ba789d73a47634bb1af36f43620efb6f53e3edd6aa"
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
