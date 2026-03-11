class VibeAT110Beta71 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.0-beta.71"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.71/vibe-darwin-arm64"
      sha256 "b695c3dc4e78203c9166877bc299c9bcfd14815cb8a25b5ffa56cc2633ae4eb7"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.71/vibe-darwin-x64"
      sha256 "ecdfba86b4cec025e4bc894a074ffdcbeb86eabf2ead1cef60f183033b081d45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.71/vibe-linux-arm64"
      sha256 "b967213034ac1462ca7e413beb91bacfa3c075112a479dcb9cc9fcb7e8168bd8"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.71/vibe-linux-x64"
      sha256 "e1b0240a7136ea69d9163342fff19c9bcbf25046e7b9488eda52d7340df09220"
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
