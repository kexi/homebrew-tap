class VibeAT111 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.1"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1/vibe-darwin-arm64"
      sha256 "edb1d025848aced5b991b844fefb4f20fc6356c10c5545a5b4ad825930168a75"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1/vibe-darwin-x64"
      sha256 "10db63b1b8ef1da3acc0d50bb3781d678f899399ed11f97de6354906b07b4c05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1/vibe-linux-arm64"
      sha256 "320c390bf3e8f6a41349957f75de50c75c569d44593118c0859d5fbd9dc82388"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1/vibe-linux-x64"
      sha256 "1d302d6bd9a98911481b3b8643048c154594183e596db26f7d0e25b1c8c71870"
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
