class VibeAT180 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.8.0"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0/vibe-darwin-arm64"
      sha256 "03de54104ae93579275574a5f3e641bd70cd1cbed6b96fa882c8ab30b18dd816"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0/vibe-darwin-x64"
      sha256 "972d74c23d2efe387b2794f2a3646500400c1d5ee7dc55067da4b269af14d64c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0/vibe-linux-arm64"
      sha256 "ea2f7c1e1e639d384721714f528736fd75c4ab3c0173a66e1163f524002ede18"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0/vibe-linux-x64"
      sha256 "20adccbacdce3d59f1aa88c123674b14ec8ac206a757ab5f1ace5db860a8a968"
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
