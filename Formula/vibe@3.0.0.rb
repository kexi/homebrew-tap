class VibeAT300 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "3.0.0"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v3.0.0/vibe-darwin-arm64"
      sha256 "594246d1b4b6627d12cdb4bc3a8eb7f5810e66c5a32f5fb24f7cb5d96a1a9720"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v3.0.0/vibe-darwin-x64"
      sha256 "3c0a2739e88021c484a92e9cfbe7a05e6100b1c8798c03a54167446cf220069c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v3.0.0/vibe-linux-arm64"
      sha256 "3bc66bf9d6a3aeed3a3508cb36fcfb3bd6b0bd7ca46f6b3e4e5c9b6d0642837c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v3.0.0/vibe-linux-x64"
      sha256 "aa1c35c1e345c559dd55ddfe1cac0ed97233b3a5b3559ae5947a960633599a7a"
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
