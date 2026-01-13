class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.5.1/vibe-darwin-arm64"
      sha256 "e28313961dde90a1d162246a874f3dddfac733cba5aabf8ce440c3f04f0972e2"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.5.1/vibe-darwin-x64"
      sha256 "b347fe043bf0ab526b79055cc799b41479b21685eb20eb0390fca1c52363b6e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.5.1/vibe-linux-arm64"
      sha256 "051a2dd4d151c046d4efa2265bc64ef5b8b5de1987658d58378565590d35818a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.5.1/vibe-linux-x64"
      sha256 "0bb8b9a58d1febce88322c7fe6c174005d0f14d4e26841f88ca7f9176b4e493d"
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
