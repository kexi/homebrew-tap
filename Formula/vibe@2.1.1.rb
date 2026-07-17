class VibeAT211 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "2.1.1"
  license "Apache-2.0"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v2.1.1/vibe-darwin-arm64"
      sha256 "39965a42bd85c283c8fa436fb76591cd532ece70d1be2028727b444641f46d26"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v2.1.1/vibe-darwin-x64"
      sha256 "5460caaa57cc3af2d3a5e44333de9415e62d1d6c4ed62a04816253f9e8eafeb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v2.1.1/vibe-linux-arm64"
      sha256 "7eac19f8d9c9547d9ad19196a06fc0630bf56536cae7484d9ae47214088d0596"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v2.1.1/vibe-linux-x64"
      sha256 "317a161f7316ff6213f2347f676e0c98e563b3f3f860d71ff8c26192bbaf8790"
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
