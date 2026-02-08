class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.19.2-beta.36"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.36/vibe-darwin-arm64"
      sha256 "7e6726679f3e4b3304a571f4852d299a70bdee30dfb4681c9b78f82571d66aee"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.36/vibe-darwin-x64"
      sha256 "96f6bad569ba0f03fd73700f594c2987402dba21971f942306542bafd40771ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.36/vibe-linux-arm64"
      sha256 "656a36029ac2a376cb756d2e52ee40cd3824ba1ccc1f62ecc6a7f8cf541b90de"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.19.2-beta.36/vibe-linux-x64"
      sha256 "d8d49f7c586b7b4afc9e5a578dc21c2f87ae3fa827652c3f59259e2697f1660c"
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
