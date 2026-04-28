class VibeAT140 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.4.0"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.0/vibe-darwin-arm64"
      sha256 "ecaf4dc81367636d78baf94bfa50e1dba39f68c11c012f4f05b60e00e1635b12"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.0/vibe-darwin-x64"
      sha256 "6f81d92915393245687e18432532395dc05e0ea9ee586eb1badba6b5d44de486"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.0/vibe-linux-arm64"
      sha256 "67408cfa69a5852eca3205edfc7149f38524bf5bf86ab50edc57056b8ce3c4ce"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.0/vibe-linux-x64"
      sha256 "501fb44bfba86ebdc8a9c25cc8443956c5cf4c7851bb4ab270f24a577123bc46"
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
