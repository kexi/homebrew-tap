class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.19.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1/vibe-darwin-arm64"
      sha256 "015f3121e6bf872fa0f2622029577b6d3e6e1205f525ca133da594a3cc3043a0"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1/vibe-darwin-x64"
      sha256 "74b26d9c0c5bd8d1cea4f09c7ff2ce0eb0f05feb4e907e5698f07804814bbda4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1/vibe-linux-arm64"
      sha256 "2936cc11ebadb224a0c36b8d4aaf88c1f524828bfeb48df23cf5fa12a450110c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.1/vibe-linux-x64"
      sha256 "7c59269c4e5dcd37682275cca8b9c7f12d6d226325062ff68c8cd6926c7296fb"
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
