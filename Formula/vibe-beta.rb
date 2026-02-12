class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.22.1-beta.49"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1-beta.49/vibe-darwin-arm64"
      sha256 "55e71546aa5ea9a213df5347f6c070d21a70c326c396c4e07659fce9efde3adb"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1-beta.49/vibe-darwin-x64"
      sha256 "aac79c370066605bc4c75bebd4bd549aa47602ad3bad6cb9bc9370912c297539"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1-beta.49/vibe-linux-arm64"
      sha256 "a5d494dd109a82cc5093f95de33bf27eb27e3ad915d12cf88d1e0913f2d431e6"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1-beta.49/vibe-linux-x64"
      sha256 "386caf20f5bbd6d9fa53b48d26a23fef7bbd5a09960385577eeb98ad2c29c307"
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
