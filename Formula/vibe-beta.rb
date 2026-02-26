class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.22.2-beta.55"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.55/vibe-darwin-arm64"
      sha256 "7785bf20fdca27356dbf06cfe69db4d74e2ba9cb29bbeca18ff7275ca29d8e62"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.55/vibe-darwin-x64"
      sha256 "3f6a6879656cba88aba69d17ee4db2e32ec700bc5d6e7eb07264ec1483ab1e65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.55/vibe-linux-arm64"
      sha256 "7a2f9d2e861d8ac2cbabb7fcd92d96ccfcefbcb043ac3121ca2b03bb94dfbb72"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.55/vibe-linux-x64"
      sha256 "42e2a1015f002a48e3cf5cd1cb4e2b6f05e27e8f4fcec60dfb9f8cbbb5c21b42"
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
