class VibeAT130 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.3.0"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.3.0/vibe-darwin-arm64"
      sha256 "17c8dea2968dced2863f0e7d16da4d8683eb44fd425606d7a31e938804b2ec68"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.3.0/vibe-darwin-x64"
      sha256 "e5b8921957c6fe4e5caa26bf67583e82fc902635c671ce7a8b4b229a7b553117"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.3.0/vibe-linux-arm64"
      sha256 "b45994bd4fe51678fb8cff641acca72f34b727e25adb78941c75a56ce2007d91"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.3.0/vibe-linux-x64"
      sha256 "1f3172b02f4a50f5021dc21d7288564e56b1a9d33ce7c0847c9dfa825ba7774e"
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
