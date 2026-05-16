class VibeAT160 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.6.0"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0/vibe-darwin-arm64"
      sha256 "381597b33b5a79f20fdb5cb6a4360961763b2aa5cdb3d0fc6c63c9076a89ea90"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0/vibe-darwin-x64"
      sha256 "76f30d59096ffe314f9cd5da2557c9d2a41c08117ec7632ba45e5a11e8b6173e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0/vibe-linux-arm64"
      sha256 "b6aaf069e6481dcbfbb9151df42673b7b4db4b5998e77461cc8a56e49d222805"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0/vibe-linux-x64"
      sha256 "bb27a98891823a134e6b24b0e2fd95ad674b70efdba630741a1c76ff013acb04"
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
