class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.0-beta.64"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.64/vibe-darwin-arm64"
      sha256 "7ef828881da4b669ef73e8783c9a3b5a778dfce50e0301871cee1b79b6e63979"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.64/vibe-darwin-x64"
      sha256 "7cda1bc627e807af21b1d50dba1b64b828e579f5bb0f696b81da1a7ac4e6759f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.64/vibe-linux-arm64"
      sha256 "e077a23b8eebb07f4c89cfdd6ffa979d04b67dcd456a630384b819a728e06f91"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.64/vibe-linux-x64"
      sha256 "46efc8f330fbb3659bfa393eb8bad8c19c655f57f37a4b02b2d1d727875f9a7f"
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
