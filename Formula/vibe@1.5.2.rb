class VibeAT152 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.5.2"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2/vibe-darwin-arm64"
      sha256 "d51bc4fbd3bec2e860f3b0591400adfde51d1d73d08f6626b0319033a3414fca"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2/vibe-darwin-x64"
      sha256 "4d98c8ceaffc9a9cf28535775b8087774c097b2af6ae62d6a4ca49b0f06d6b3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2/vibe-linux-arm64"
      sha256 "d978eca4e55909115dc59699ea563ea76e35438cd4527662911e803943f112a8"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2/vibe-linux-x64"
      sha256 "9925ea5928028620101818b1bf555496722ad3811ea5c5bff46f8855f2684656"
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
