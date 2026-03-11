class VibeAT110Beta70 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.0-beta.70"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.70/vibe-darwin-arm64"
      sha256 "476d302b13db2251c7999d2cbe71af0708fe5d71e1b9eed3e87d358880b8595a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.70/vibe-darwin-x64"
      sha256 "b7ac0530df3beaecaf6ba687e70cba7636efe3ba8bce830800a53cd3ef416702"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.70/vibe-linux-arm64"
      sha256 "40081cb663c1becb3f4dc1f714867ae62ca4a0133a4ba9ab55e65b6579c12508"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.70/vibe-linux-x64"
      sha256 "0b0e1aa689c4c09f408c163f4cf2c80289a2d14c1111cef71c411fbd085bb9e1"
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
