class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.21.0-beta.43"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.43/vibe-darwin-arm64"
      sha256 "8ceaeda0d9dbb8b15896083e2bed2ec48361314877f97ac6d97aecfae9a4de22"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.43/vibe-darwin-x64"
      sha256 "185b0a2f59593fd91ace9d25855c37867cf7262619fc85837b51f79196084e54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.43/vibe-linux-arm64"
      sha256 "958620dc1dcbf89ee447dd6bae1cf232839baaffd9ae736cfb9d8f344ce6dd25"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.43/vibe-linux-x64"
      sha256 "a50a862e717d0ec5f51443acf87799abe2206458dfb895955ccc43d4f1a2cdc9"
    end
  end

  def install
    binary_name = "vibe-darwin-arm64" if OS.mac? && Hardware::CPU.arm?
    binary_name = "vibe-darwin-x64" if OS.mac? && Hardware::CPU.intel?
    binary_name = "vibe-linux-arm64" if OS.linux? && Hardware::CPU.arm?
    binary_name = "vibe-linux-x64" if OS.linux? && Hardware::CPU.intel?

    bin.install binary_name => "vibe-beta"
  end

  def caveats
    <<~EOS
      ⚠️  This is a BETA version installed from the develop branch.
      It may contain unstable features. For the stable release, use:
        brew install kexi/tap/vibe

      Add this to your .zshrc:
        vibe-beta() { eval "$(command vibe-beta "$@")" }
    EOS
  end

  test do
    system "#{bin}/vibe-beta", "--help"
  end
end
