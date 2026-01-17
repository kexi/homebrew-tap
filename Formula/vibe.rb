class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.12.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.5/vibe-darwin-arm64"
      sha256 "dce1eb5fc154b3c8664b3d53784fcc0164145244633a787b6e20ad721d55df2e"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.5/vibe-darwin-x64"
      sha256 "8c239a399955d48bf306c7752ef18334b0e186d7de33a7055880000917da348b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.5/vibe-linux-arm64"
      sha256 "4d4d2905013878a3ca94d5470180b1a0c256415c77b6b837939491e356c8982d"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.5/vibe-linux-x64"
      sha256 "221013da40a65450d3c85a5d6107182b55583fabbbf6544fb56b8c3a8f2f8fff"
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
