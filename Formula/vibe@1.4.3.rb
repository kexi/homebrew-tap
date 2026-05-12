class VibeAT143 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.4.3"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3/vibe-darwin-arm64"
      sha256 "bc465d7b974f3ff0f4582c81fb477c8f5b74b6f6c25f396336ed98cb1a7eab97"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3/vibe-darwin-x64"
      sha256 "872bbb31d1ce3c8a28f112042e9f77d48c06c047203cb59f98df9cf51e9c6749"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3/vibe-linux-arm64"
      sha256 "25f2697bb8510ffc3b652dba932389295febceb52127e269fee1f16758722278"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3/vibe-linux-x64"
      sha256 "ea4254427aeb1fbedb37bd06c1d3bca81c27660c04cf4c26d120fed86b9ea40d"
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
