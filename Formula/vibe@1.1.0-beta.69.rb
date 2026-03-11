class VibeAT110Beta69 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.0-beta.69"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.69/vibe-darwin-arm64"
      sha256 "6b22db15eb429f4a0ffb521b0d59d6aac80f8a2f31e1a77a025dccf8a521af7a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.69/vibe-darwin-x64"
      sha256 "603bb9a9c1a28932985279bb59f78fab157ed802b50e03c598b439959f4a97e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.69/vibe-linux-arm64"
      sha256 "1ad0c5f238611157be160a5c21b28ee5cafed5c49a59b55e6188956c35906f24"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.69/vibe-linux-x64"
      sha256 "4c1b102e2b0f6e25f1f9a5a36b895c5bbef44630a196d4af30693e7a2589ae95"
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
