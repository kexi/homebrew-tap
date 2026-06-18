class VibeAT200 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "2.0.0"
  license "Apache-2.0"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v2.0.0/vibe-darwin-arm64"
      sha256 "03908db6621e8e20ac6cb65de733de36296dda698812b3a3fd0cabe72a558218"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v2.0.0/vibe-darwin-x64"
      sha256 "d6a201d9a0118c083a008916ebaa42b316be0007e38f7230de5517991e6fa17d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v2.0.0/vibe-linux-arm64"
      sha256 "843d100596973d107eacccb3bd8b400c52b5a9c9a7e91f24d4c5ef1ab9d7b5da"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v2.0.0/vibe-linux-x64"
      sha256 "cd1f4e50870959f5ce1e79c102b6cf98b35c8943bd9189a16da6c0a585e14a77"
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
