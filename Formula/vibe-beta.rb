class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.22.2-beta.53"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.53/vibe-darwin-arm64"
      sha256 "fedcf5256f996a4f3167cd96bb62911732f42404260fdf15f5a02b74e5f0df93"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.53/vibe-darwin-x64"
      sha256 "f5c2b1291116fe31ae566dae7d65fe2e7490d3467d417790c564bff24e0654c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.53/vibe-linux-arm64"
      sha256 "ca6f0ef86aa15330af77a3883e653a0de403fbec40b045bf2517602b4d1a685c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.53/vibe-linux-x64"
      sha256 "c90b5f6fe1cc2967827db268dda46bbc80f84f3690ea0198da27bda6f28b79bc"
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
