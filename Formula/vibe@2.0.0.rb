class VibeAT200 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "2.0.0"
  license "Apache-2.0"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v2.0.0/vibe-darwin-arm64"
      sha256 "b8f4d27d3401da44bf32b721e4e1ef95b1884e4343422326df5d48afa014bccb"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v2.0.0/vibe-darwin-x64"
      sha256 "317d78370bf9a713d9331550fb21a52691e04e543501b86e996368fd1191c38e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v2.0.0/vibe-linux-arm64"
      sha256 "281cfccb1abb3df16079496f0990822db4150de8b50f44031e9d45c6bf917f81"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v2.0.0/vibe-linux-x64"
      sha256 "2b3fe23ac92cb009cc5418acbf878f3dcc1cf4b0f9919a09279b261a0610cfb2"
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
