class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.22.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1/vibe-darwin-arm64"
      sha256 "e2711009b32e4a06a48163f48041aeae30c12cc473f5bd10640aef362ad47ec0"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1/vibe-darwin-x64"
      sha256 "14d17399384ea53f089ec3288968ac693050b63b2716f841c5d735ae3045cb16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1/vibe-linux-arm64"
      sha256 "28d2998b5814a3ac3793c53e3c08648f800c6e980f6d5a66d588a58af6af6aad"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1/vibe-linux-x64"
      sha256 "2ab5fb56b727bef69b11985d23ebd29c62e5a892371a88fdce3b3556e4cb7dc0"
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
