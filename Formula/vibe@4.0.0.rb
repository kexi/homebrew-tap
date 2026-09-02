class VibeAT400 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "4.0.0"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v4.0.0/vibe-darwin-arm64"
      sha256 "2a57ade93aeccacabb4196db22eaf7302af30f844f9641fa0f05c2536d8f4b2b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v4.0.0/vibe-darwin-x64"
      sha256 "2b1a54926a7e84c590fb7ae0cde6f6855b705ae0beddc86f78355f4df06edb90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v4.0.0/vibe-linux-arm64"
      sha256 "679fea5f03df1e63ce282a67eccd98ff5d13cd5f436bcd07049fe63f27891b75"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v4.0.0/vibe-linux-x64"
      sha256 "9dfb8ef59e29c4d54cf51a896bb557b77191ba864abd19f385554e195e042167"
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
