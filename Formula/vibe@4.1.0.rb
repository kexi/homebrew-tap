class VibeAT410 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "4.1.0"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v4.1.0/vibe-darwin-arm64"
      sha256 "d47c16b475b883649f0d49e858fe9c9b9922953cd4caae680fbf4802d8b05b18"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v4.1.0/vibe-darwin-x64"
      sha256 "d49a4d6673a2760f009db9c5527dc3e6e227b45043f44020c8c2bde9569aaa24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v4.1.0/vibe-linux-arm64"
      sha256 "7f480155edc8b4dda9473132cda90709ee57bbf6c0ded0659a65a78c8180b09b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v4.1.0/vibe-linux-x64"
      sha256 "8769c7202e518d64de23acae23ad718b8160b3e79979aff999c6b7f2005ac9de"
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
