class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "4.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v4.2.1/vibe-darwin-arm64"
      sha256 "0b483904e05a6bed6b56f17994c3c0a37883db63c443ce475732fa7d305b9fe4"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v4.2.1/vibe-darwin-x64"
      sha256 "bbce2b44d574470027007f0f9bb71569c2780b3de75329ff4ce1dc73aab23a50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v4.2.1/vibe-linux-arm64"
      sha256 "20480c56b11c7c9d74fbc5249c5ef180908043ffa5ab29c560981f2fe5a939cd"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v4.2.1/vibe-linux-x64"
      sha256 "d310338bb10066b4755d0f5f7c83b35f8bf63de98be471d0b6b430a7c3460221"
    end
  end

  def install
    binary_name = if OS.mac? && Hardware::CPU.arm?
      "vibe-darwin-arm64"
    elsif OS.mac? && Hardware::CPU.intel?
      "vibe-darwin-x64"
    elsif OS.linux? && Hardware::CPU.arm?
      "vibe-linux-arm64"
    elsif OS.linux? && Hardware::CPU.intel?
      "vibe-linux-x64"
    else
      odie "Unsupported platform"
    end

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
