class VibeAT141 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.4.1"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.1/vibe-darwin-arm64"
      sha256 "56ea3cc752a9fa199ac62de53207ed203d7ac21610f47edbcf4b2f4b3f9e9f3b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.1/vibe-darwin-x64"
      sha256 "1aff9ad4ea44587f988c82ff765ab4d9fd87031133248050a05bfc13a50f0a51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.1/vibe-linux-arm64"
      sha256 "158bd5a4dba69445b8d3550688336658ea3018541427e217770a38211b3423ff"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.1/vibe-linux-x64"
      sha256 "bfe2c60aace9b07719347c8fb69518d6281bbddf763773fe864e10dd13b06287"
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
