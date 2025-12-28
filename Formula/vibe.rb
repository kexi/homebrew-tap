class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.2.2/vibe-darwin-arm64"
      sha256 "3db81ac88281e55b7a40d3ad400d12d2caa5ffecf607fb299446608f8107c124"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.2.2/vibe-darwin-x64"
      sha256 "b918f2b112346cad449f21fb53277392cf3ec321fc0a1550fe833e73cf6e5e88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.2.2/vibe-linux-arm64"
      sha256 "7761336a2f010f0c31b9968cc6a995c2ef8dc01f6fd848b0d88edf52c1e2548f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.2.2/vibe-linux-x64"
      sha256 "dc11bac45668e3eb4c8a69e53588a8d7c859ac955366c4a9e3ed27298069d53e"
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
