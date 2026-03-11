class VibeAT110Beta68 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.0-beta.68"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.68/vibe-darwin-arm64"
      sha256 "36eaf95d144e60accb115ffa8aa3cd354b9e1dd05b4657acdbe07f1c6c219c3c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.68/vibe-darwin-x64"
      sha256 "8dc028959d0901afdb747409cdbaef228c358e5b46fabee1fb31b9b4bd49c8c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.68/vibe-linux-arm64"
      sha256 "779a7c59967da260d976a06863ddd2d07ea3eccb91267c21860006f83f23776a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.68/vibe-linux-x64"
      sha256 "9994d3023a744561e22cda69faedff8a72fb6b91231c06ea6ef8a1f408415760"
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
