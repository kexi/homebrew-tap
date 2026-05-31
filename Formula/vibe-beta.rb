class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.7.1-beta.124"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.7.1-beta.124/vibe-darwin-arm64"
      sha256 "6c703aabbc9f8219fe0cdd9efd412a554f74c14f4efe79aebced9d83d2a0d143"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.7.1-beta.124/vibe-darwin-x64"
      sha256 "b5e2c1dd5f164144849ffc21b76156954485d35ea3b1d70496762ee15e5fb7c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.7.1-beta.124/vibe-linux-arm64"
      sha256 "c403a8ebfe2a73d265dbc8559ee684eef53e6c1a4902fe1cf7ea1cf548457a5a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.7.1-beta.124/vibe-linux-x64"
      sha256 "e04c5c35bc70368c5924b54b94aaf827e108609d7301885feeac8e663ff923c8"
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
