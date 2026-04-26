class VibeAT120 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.2.0"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.2.0/vibe-darwin-arm64"
      sha256 "bd4a9e9abd9b8f74224d6ac9a1e791a6c1bb3f487c341e8381768006d8cf2d64"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.2.0/vibe-darwin-x64"
      sha256 "d7e6c0ff161cdb349f32a50a9b618b9f6d02ee75b46bdedac064ae144ff90623"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.2.0/vibe-linux-arm64"
      sha256 "e046706bf2812e93cc507be30e388aabea9cf429e3933aadefe4a752e91fdd3a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.2.0/vibe-linux-x64"
      sha256 "196d8122836e91c4291209330a5fed0db8e9a4af3fda76a80041797221826c62"
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
