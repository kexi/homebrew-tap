class VibeAT110Beta67 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.0-beta.67"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.67/vibe-darwin-arm64"
      sha256 "0b2e516cd50804d835b4f10916681a5ad2454dd164c58c76b278a101de4a364c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.67/vibe-darwin-x64"
      sha256 "f85045d61e5c5b61181836e14a627184c15aeb0fef0c8b217411a3524ec415e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.67/vibe-linux-arm64"
      sha256 "fef2bec9b646cc507f373cd27fbc07fe85cbc8b666fdd148ea721f67a867636f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.67/vibe-linux-x64"
      sha256 "07cfb19b4340b4c94c72fd434f3446edad3cf31a5d8edb71303be662347368fa"
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

  test do
    system "#{bin}/vibe", "--help"
  end
end
