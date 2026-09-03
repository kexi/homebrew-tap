class VibeAT420 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "4.2.0"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v4.2.0/vibe-darwin-arm64"
      sha256 "c4a5ed2f113f809974c4a2677ce8b2211620989860928c3476882d3be42169aa"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v4.2.0/vibe-darwin-x64"
      sha256 "cbc3897c4e472f0e304e898958a301e8a6b148ebcd79a04b33e89ddf01489455"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v4.2.0/vibe-linux-arm64"
      sha256 "755e0c6145ccb196bf357b70bf89a072c0b226b664b3dc474b06b560e0fe507c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v4.2.0/vibe-linux-x64"
      sha256 "0c314fa5c3a73c458a7029da5a9d868d1ac350795cde1d7ce847b07cc75d4593"
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
