class VibeAT170 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.7.0"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0/vibe-darwin-arm64"
      sha256 "09096d81f5818fe0e7b0865c17b5482383a6a3c1b16ee58b49671ac0f8857ae1"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0/vibe-darwin-x64"
      sha256 "5f74108d21996b8cdbb76500dc52e42006709c296375152a5eca3b27f83a1c47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0/vibe-linux-arm64"
      sha256 "899b9be12ba6e1487fa10164b0dd317860cf0cd10288f0915b75c967994c3214"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0/vibe-linux-x64"
      sha256 "32805f5d815d02e4b0644a157a899f9d3d38c3c7b25a2435b279ab17d04e11f4"
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
