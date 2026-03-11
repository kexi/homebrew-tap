class VibeAT110Beta66 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.0-beta.66"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.66/vibe-darwin-arm64"
      sha256 "ede2838335c707c84f778185ce46531e8b4584dc90938903f5700041389745e5"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.66/vibe-darwin-x64"
      sha256 "671185ef8bf7887d5a9a1e2daa8178d6a37bc32672ad787738757c099babc8b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.66/vibe-linux-arm64"
      sha256 "d31e857fbb6e434aac2f2573a4892cbeea1cce75ff9b367283c7e443833d6fd7"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.66/vibe-linux-x64"
      sha256 "fd3d019aca1bad58fe1c56a14ba940df0bfed84723db0d10a97bf12a13dc992b"
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
