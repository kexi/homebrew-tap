class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.16.1/vibe-darwin-arm64"
      sha256 "73f5838b309fcf4ecbc61c59c5319748c1f185f5ce635c3e2d477f430f4b64e4"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.16.1/vibe-darwin-x64"
      sha256 "941fafecdeca7f8aec88db9e729c716266e1f9552d115e62bcfeb8ece39867ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.16.1/vibe-linux-arm64"
      sha256 "f1a1eba0c6484163b9247f2c2e469f8f7e32efca4e4e806907ef4dca77c25178"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.16.1/vibe-linux-x64"
      sha256 "40643dbb6665baeb02fe18c5392a794de68d365d0ab698a49a3e33136c6e16cd"
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
