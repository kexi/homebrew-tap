class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.4.3-beta.104"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.104/vibe-darwin-arm64"
      sha256 "342b727cf936482a303588cb113ad0e7d14588b7a04d897478adffe7a7874ede"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.104/vibe-darwin-x64"
      sha256 "a36f8b2b1d231bd7a3fdaecfca7ce12a0083f03eacecee50a137199a95ffc890"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.104/vibe-linux-arm64"
      sha256 "ce435c8407e8617cd192c14d8cada9c55e8246e2fb7a59971699e87c008c4d0b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.104/vibe-linux-x64"
      sha256 "033596f515e642e9f130c84218d85da70c6bfa36016a1cfc04076e95827d31fe"
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
