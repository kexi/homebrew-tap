class VibeAT150 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.5.0"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.0/vibe-darwin-arm64"
      sha256 "cb8c69f7df8049c81bcdc35e2737280601e5db7395c2ddcc9778ce8888206a2b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.0/vibe-darwin-x64"
      sha256 "6da50c284e3a9c273ee545870f423739450b37755c09573b1e7df28dae5669ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.0/vibe-linux-arm64"
      sha256 "9187fe798ce0db58a5f892209def72f8cb6d1cd4a3c1a5496275d2b2a4bf7944"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.0/vibe-linux-x64"
      sha256 "89417b601416b499a69fe8f10eeace7f052c8b58992b88b40bc7857106592cf9"
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
