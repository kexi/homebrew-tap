class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.1.3/vibe-darwin-arm64"
      sha256 "9d99b8604c8f3efee8bb3b4907e013ebe44a5c95c3e7e39bb1a5a50bb320bf7b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.1.3/vibe-darwin-x64"
      sha256 "23b089cb4fd5914351e032345bef691c1eb32d62515860c22039f86cee2673ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.1.3/vibe-linux-arm64"
      sha256 "1fa0a951d55cce4320d626077f5ae25c47ac9ad932231dba09f06f7968c7fbb5"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.1.3/vibe-linux-x64"
      sha256 "fd9f95821eecfea5b02585203009278caf242528819c2fc58a9668371e6d1ecb"
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
