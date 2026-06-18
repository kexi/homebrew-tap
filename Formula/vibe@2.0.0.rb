class VibeAT200 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "2.0.0"
  license "Apache-2.0"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v2.0.0/vibe-darwin-arm64"
      sha256 "9b88e09ee03a2e11f5c0e90ccaa7f96ac2e20c81f36061ee1d9d943262c3504d"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v2.0.0/vibe-darwin-x64"
      sha256 "52e3073adc81b9fb88d6dc18df336697fe36f15031d9dedc81b970545d79ad81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v2.0.0/vibe-linux-arm64"
      sha256 "d443612a7701a3e1af44563b1be8d77d68fd107d2d974e6b8726f34367d7117f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v2.0.0/vibe-linux-x64"
      sha256 "28d6007d7e05ded22c4e0b19d78a4da87b0b94e29b727fb45ff6d4f5852a94c1"
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
