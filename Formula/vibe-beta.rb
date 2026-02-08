class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.21.0-beta.44"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.44/vibe-darwin-arm64"
      sha256 "282016725380834ceb3c7c5f8217daee44e82e844b7572162eaeda8f88595ca5"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.44/vibe-darwin-x64"
      sha256 "d497adb8e3d59f564c4d1edc7fca7fd9a036cfcaed87964cb2a1dee9c481e963"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.44/vibe-linux-arm64"
      sha256 "ff0c4eb6f6a3d2f9fd85147354cdec5f41ca3f23169bd3b50a2d457278fe4e7d"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0-beta.44/vibe-linux-x64"
      sha256 "cead97dc622981820e42a925e55bc8486fe8f90c433197865260a4edd9f435b0"
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
