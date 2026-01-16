class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.9.1/vibe-darwin-arm64"
      sha256 "89f304a150d741007548175679aa1e8f8b7a47e0de972582748d92a643ba9421"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.9.1/vibe-darwin-x64"
      sha256 "0cabf49cd88f4ab546570bff1cb1ae13f8f9ec93bde22295b8b8ac4f39dff628"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.9.1/vibe-linux-arm64"
      sha256 "448c5dc8b7c53cc2d13d249fd7529e704f88f359f188e4e7c6826bc61eae09c9"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.9.1/vibe-linux-x64"
      sha256 "3e14db0228c79c336712135dccabe217d84b8199fdbef20bdfcf69b73d2342cc"
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
