class VibeAT220 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "2.2.0"
  license "Apache-2.0"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v2.2.0/vibe-darwin-arm64"
      sha256 "b6fabaaa5c50661c1ab735786e14349b5e018bc4d09f1e5e2ae0fdf66032aea4"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v2.2.0/vibe-darwin-x64"
      sha256 "d233cf0d28c256a1c04248ec9f611b6343573999f7624ab9596936ed9e333572"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v2.2.0/vibe-linux-arm64"
      sha256 "eb16949e7d4c0de0cbeabfaa6768ce6f090d1e9970bba4b75e09174d4bc90863"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v2.2.0/vibe-linux-x64"
      sha256 "2862aee6e375adfe39f737a3a9772ac147b4eece37fef820eff0566c0de6d354"
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
