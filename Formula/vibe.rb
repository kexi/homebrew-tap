class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.9.0/vibe-darwin-arm64"
      sha256 "2b4f97b9f039d8ff5089151a9535816f49526c75eef373ee56d2083e5f251ade"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.9.0/vibe-darwin-x64"
      sha256 "375fe5985148c25a96c4eb7adac5f81779166accc55bdda39673c3a809aaad5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.9.0/vibe-linux-arm64"
      sha256 "6c73d56a031743949b319a532dfbf268d43ea1f9c0f7c10d857ee53391f24a20"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.9.0/vibe-linux-x64"
      sha256 "39629441996438e73f29496940d410321b095338672941b21d7d13e494e297b6"
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
