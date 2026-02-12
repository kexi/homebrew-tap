class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.22.0-beta.48"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.0-beta.48/vibe-darwin-arm64"
      sha256 "d1d6a29e10e848690e2bbba8a0bde7d9f9d371b80f055bb3f4f598cf29a78a8b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.0-beta.48/vibe-darwin-x64"
      sha256 "732e0c027fa043a199aea556e89b7c731cdb717a612c6ebbb073adeb4c737b2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.0-beta.48/vibe-linux-arm64"
      sha256 "b39795d4e05a2625cb56cad93dda0441bc7d0577644c09071dc701da0bfaf930"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.0-beta.48/vibe-linux-x64"
      sha256 "06f6a353ee526cedb057166dc7d294997a4a59575d0417a3efadca07837360aa"
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
