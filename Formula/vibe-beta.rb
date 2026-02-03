class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.18.3-beta.17"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.3-beta.17/vibe-darwin-arm64"
      sha256 "6820f625ac36f5f47a5e1f9bee155198539c9713d1f4f43d7eca41cc4b52387a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.3-beta.17/vibe-darwin-x64"
      sha256 "7653ba6dcf1ed50cb332bcd99c8a2fb418b0c23eb3d26904954fc363523c00cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.3-beta.17/vibe-linux-arm64"
      sha256 "457c8d2e0f61b6ca8f7ce5d0040023325c5ba66012d879b6ffef6ad3686154ce"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.3-beta.17/vibe-linux-x64"
      sha256 "c146c65b409f5d0ec8580a21eeab9541db07a22d50dd46541ef1c5cf181139bc"
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
