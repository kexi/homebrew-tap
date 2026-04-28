class VibeAT142 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.4.2"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2/vibe-darwin-arm64"
      sha256 "9251706ef9086a88d135184c956369f8ae72db9235cd34d6227ee0a7f38572eb"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2/vibe-darwin-x64"
      sha256 "c3a3c43536f45090ed5eb416f8db43b29c7294271622d7e8f59e4559b1958a08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2/vibe-linux-arm64"
      sha256 "5874cd90299811c1697c203e9f83ef8f50612d472df21d19a34827492947e5a8"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2/vibe-linux-x64"
      sha256 "800b844bd0edc38ff9b6d4bd6789245f373fd17c86d9b110fdc547115f6add42"
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
