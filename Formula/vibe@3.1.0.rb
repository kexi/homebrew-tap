class VibeAT310 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "3.1.0"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v3.1.0/vibe-darwin-arm64"
      sha256 "4c1d62ab714b6b38363a80930e32d68330bf96bb99f5e8e32932cef9df90c650"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v3.1.0/vibe-darwin-x64"
      sha256 "361ec64aaebd2a5abd849feaa6b2ae304d82ce8eccb2bfb87be54b0be437e58a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v3.1.0/vibe-linux-arm64"
      sha256 "a0e3060d2350a338efa5403ba187a3fd6e0181f0c273d82a35ebd68c97e54bc5"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v3.1.0/vibe-linux-x64"
      sha256 "d0c52a3b95b5b1517fdb8b5a07387f586302d0999ddfde73f54ccfa1edd9a853"
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
