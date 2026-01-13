class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.5.2/vibe-darwin-arm64"
      sha256 "c16fdad8d6709eedb1176acabef84a62c0f9094aec33ccf13d38e2e6a4265b75"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.5.2/vibe-darwin-x64"
      sha256 "aa89003b7e7c59991e4aee533f2916eac4ae9b666601adc46e5f580e402b56f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.5.2/vibe-linux-arm64"
      sha256 "03f5a3b902d2f970d88b7a8990bc28e5d41350b6421d5161ef2752ac44a413b1"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.5.2/vibe-linux-x64"
      sha256 "6ee291668583323bbd6211a8c75a9b14421469228ac2d3e2dcc8ab29d7d3197c"
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
