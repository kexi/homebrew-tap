class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.22.0-beta.47"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.0-beta.47/vibe-darwin-arm64"
      sha256 "cb0f4a9befb6a4a70e6ce8420d9af369aca3a47bf1f2d592030291bdd45d05f0"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.0-beta.47/vibe-darwin-x64"
      sha256 "9f5fd26a6233c8c50a5305182db65d0751f456a51084a05ed8899d0b8efb7955"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.0-beta.47/vibe-linux-arm64"
      sha256 "e06b33491ed5fb61d32e3d58d4288c59d1bc6a08ef34edad4773e1a105a113f1"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.0-beta.47/vibe-linux-x64"
      sha256 "24a0ca507ee3cffe902c61753b4432e2f08b47514c96091e641e0b24ecc34602"
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
