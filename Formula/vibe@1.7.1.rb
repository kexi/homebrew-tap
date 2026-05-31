class VibeAT171 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.7.1"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.7.1/vibe-darwin-arm64"
      sha256 "522fb7339f850cebdbad8382de68ea2025d8ed869ccf4a2d0b42113c0531321c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.7.1/vibe-darwin-x64"
      sha256 "f98e113613eff89a2ab0fbd2df5bf6e92843ae972b35225dbb5354cb2065f5fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.7.1/vibe-linux-arm64"
      sha256 "f4090364e5652ccf8ee2614191113340302ce8b04b8418ac87fc65536c04df63"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.7.1/vibe-linux-x64"
      sha256 "770cdc7c5b22044c96cd902c8c8c19bad91b7e74f1db12ce6314500737dab63f"
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
