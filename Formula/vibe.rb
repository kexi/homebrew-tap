class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.8.0/vibe-darwin-arm64"
      sha256 "40a7971877428fd97aed721000c0c9f9055a1f7edfa5bb527e2e1235640c29c0"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.8.0/vibe-darwin-x64"
      sha256 "e7ca17cc8809e693962ee3f44be9cd514390246c7d13a640426dcbed8d31e5cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.8.0/vibe-linux-arm64"
      sha256 "5fba47021417c1abaa83a12efae0ad619ba8688dab974f97d78fa13009205170"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.8.0/vibe-linux-x64"
      sha256 "851faa4e19845db0ce176d496ec69e2f84e2029c91c6d47e09682c0db5eadc96"
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
