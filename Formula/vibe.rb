class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.12.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.7/vibe-darwin-arm64"
      sha256 "2dacbe4df957deeee4c6dbba30542be8720b136b2fb1790dbf54bb2bba04aa7b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.7/vibe-darwin-x64"
      sha256 "55c6bb3c023da9de9bf72a0641b2ca44a048cfe358491cd62b4275cf605752be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.7/vibe-linux-arm64"
      sha256 "e44867ff6649008364dc2c112e647be0af13958a7665451b1778d03afce37068"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.7/vibe-linux-x64"
      sha256 "e47d0fdb5c340f92d078d5a6f4e0c4cea3c38f6236830fcf0e449fefa7bb3af7"
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
